# Consumer de tarefas pendentes que foram criadas ou atualizadas. Ao iniciar o
# o processamento da mensagem, publica diretamente no Broker o novo status
# (em progresso) da tarefa atual. Ao concluir, envia uma notificação via API
# com o novo status da tarefa (sucesso ou falha) e os dados coletados.
#
class PendingTaskConsumer
  NOTIFICATION_ENDPOINT = URI("http://notification_service_app:3000/v1").freeze
  HEADERS = {"content-type" => "application/json"}.freeze

  include Hutch::Consumer
  consume "scraper.task.pending"
  queue_name "pending_tasks"

  # @param message [Hutch::Message]
  # Exemplo de payload {task_id:, url:}
  def process(message)
    publicar_inicio_do_processamento(task_id: message[:task_id])

    sleep(rand(10..20)) # tempo ocioso entre as extrações

    dados_coletados = {url: message[:url]}

    begin
      dados_coletados.merge! Scraping::WebmotorsService.call(url: message[:url])
      Task.find_or_create_by!(uuid: message[:task_id]).update!(data: dados_coletados)
      notificar_concluido_com_sucesso(task_id: message[:task_id], data: dados_coletados)
    rescue => error
      notificar_falha(task_id: message[:task_id], error: error.message, data: dados_coletados)
    end
  end

  private

  # Publica diretamente na fila do RabbitMQ
  #
  # @param task_id [String]
  def publicar_inicio_do_processamento(task_id:)
    Hutch.connect
    Hutch.publish("scraper.task.progress", task_id:, status: "processing")
  end

  # Notifica via API e publica na fila do RabbitMQ
  #
  # @param task_id [String]
  # @param data [Hash]
  def notificar_concluido_com_sucesso(task_id:, data:)
    payload = {
      task: {action: "update", uuid: task_id},
      notification: {info: "Tarefa concluída", data:}
    }

    send_notification_request(payload) do
      Hutch.publish("scraper.task.success", task_id:, data:)
    end
  end

  # Notifica via API e publica na fila do RabbitMQ
  #
  # @param task_id [String]
  # @param message [String]
  def notificar_falha(task_id:, error:, data:)
    payload = {
      task: {action: "update", uuid: task_id},
      notification: {info: error, data:}
    }

    send_notification_request(payload) do
      Hutch.publish("scraper.task.failed", task_id:, error:, data:)
    end
  end

  def send_notification_request(payload)
    begin
      response = Net::HTTP.post(NOTIFICATION_ENDPOINT, payload.to_json, HEADERS)
    rescue Net::ReadTimeout
      return requeue!
    end

    logger.info JSON.parse(response.body)
    yield if block_given? && response.code == "200"
  end
end

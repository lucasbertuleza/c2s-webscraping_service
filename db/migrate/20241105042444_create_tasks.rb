class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :uuid, limit: 36, null: false
      t.json :data

      t.timestamps
    end

    add_index :tasks, :uuid, unique: true
  end
end

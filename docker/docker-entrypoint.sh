#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /$HOME/$APPNAME/tmp/pids/server.pid

# Setup database
bin/rails db:create; bin/rails db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
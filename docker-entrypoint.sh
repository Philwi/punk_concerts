#!/bin/sh
rm -f tmp/pids/server.pid
yarn install --check-files
bundle install --path=vendor/cache
bundle exec rails db:create db:migrate
bin/rails server -b 0.0.0.0

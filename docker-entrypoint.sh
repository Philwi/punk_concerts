#!/bin/sh

rm -f tmp/pids/server.pid
yarn install
bundle exec rails db:create db:migrate
bin/rails server -b 0.0.0.0
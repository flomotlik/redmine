#!/bin/bash
bundle exec rake db:drop db:create generate_secret_token db:migrate redmine:plugins:migrate
RAILS_ENV=production bundle exec rake redmine:load_default_data

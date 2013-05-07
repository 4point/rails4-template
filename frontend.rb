#!/usr/bin/env ruby
# coding: utf-8

# clean file
run "rm README.rdoc"
run "rm -f public/favicon.ico"
run "cp config/database.yml config/database.yml.example"

# 聽說 turbolinks 還有問題，所以先取消
file_name = 'Gemfile'
tmp = File.read(file_name)
ret = tmp.gsub(/gem 'turbolinks'/, "# gem 'turbolinks'")
File.open(file_name, 'w') {|file| file.puts ret}

file_name = 'app/assets/javascripts/application.js'
tmp = File.read(file_name)
ret = tmp.gsub(/= require turbolinks/, " require turbolinks")
File.open(file_name, 'w') {|file| file.puts ret}

# add to Gemfile
append_file 'Gemfile', <<-CODE
gem "kaminari"
gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails"
gem "google-analytics-rails"
group :development do
  gem 'guard-livereload', require: false
end
CODE

# bundle install
run 'bundle install'
run 'rails g bootstrap:install'
run 'rails g bootstrap:layout application fixed -f'

# default controller
run 'rails g controller welcome index'

# 改 route.rb 啟用 welcome/index
file_name = 'config/routes.rb'
tmp = File.read(file_name)
ret = tmp.gsub(/# root to: 'welcome#index'/, "root to: 'welcome#index'")
File.open(file_name, 'w') {|file| file.puts ret}

# 改 layout
run 'cd app/views/layouts/; wget -N https://raw.github.com/pct/rails4-template/master/replace/frontend/application.html.erb'

# apply css
append_file 'app/assets/stylesheets/application.css', <<-CODE
p.alert { display: none }
CODE

# git ignore
append_file '.gitignore', <<-CODE
*~
*.swp
CODE

# git init
git :init
git :add => '.'
git :commit => "-a -m 'init'"

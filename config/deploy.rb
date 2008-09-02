# $LOAD_PATH << "/opt/local/lib/ruby/gems/1.8/gems/railsmachine-1.0.1/lib"
# require '/opt/local/lib/ruby/gems/1.8/gems/railsmachine-1.0.1/lib/railsmachine/recipes'
require 'railsmachine/recipes'
# gem 'railsmachine'

set :application, "karate_poke"
set :deploy_to, "/var/www/apps/cranberry"
set :domain, "obtiva.railsmachina.com"
set :user, "deploy"
set :runner, user
set :admin_runner, user
set :repository,  "git@github.com:obtiva/turnerfacebook.git"
set :rails_env, "production"
role :web, domain
role :app, domain
role :db, domain, :primary => true
role :scm, domain
set :scm, :git
set :git_enable_submodules, true
set :deploy_via, :remote_cache
set :git_shallow_clone, true
set :scm_password, proc{Capistrano::CLI.password_prompt('Git password: ')}
set :branch, "master"
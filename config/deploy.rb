# config valid only for Capistrano 3.1
lock '3.2.1'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :pty is false
# set :pty, true

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :application,   :globo
set :repo_url,      'git@github-globo:martsoft/globo.git'
set :deploy_to,     '/home/deploy/apps/globomarket'
set :linked_files,  %w{config/database.yml config/newrelic.yml config/secrets.yml config/unicorn.rb}
set :linked_dirs,   %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system vendor/assets/components}
set :keep_releases, 5


# DEPLOY
# --------------------------------------------
namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  before :compile_assets, 'bower:update'
  after :publishing, :restart
  after :finishing, 'deploy:cleanup'
end

# BOWER
# --------------------------------------------
namespace :bower do
  desc 'Update bower dependencies'
  task :update do
    on roles(:app) do
      within release_path do
        execute :bower, :install, '-f'
      end
    end
  end
end

require './config/boot'
# require 'airbrake/capistrano'

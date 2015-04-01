# config valid only for current version of Capistrano
lock '3.4.0'


set :application, 'watch_dog'
set :repo_url, 'git@github.com:intheblackworld/watch_dog.git'


set  :deploy_user ,  'root'             #設置部署時的用戶

set  :scm ,  :git 
set  :format ,  :pretty 
set  :pty ,  true

# Default branch is :master

set  :rvm_type , :system 
set  :rvm_ruby_version ,  '2.1.3' 
set  :rvm_roles , [ :app ,  :web ,  :db ]

set  :keep_releases ,  10    #最多存放十個部署版本
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/root/watch_dog"

set :log_level, :debug



# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

set :linked_files, %w(config/database.yml config/secrets.yml) 

# git clone 完成後會從 shared 資料夾 copy 過去的資料夾

set :linked_dirs, fetch(:linked_dirs, []).push("bin", "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system") 

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
        execute :rake, 'cache:clear'
    end
  end

end

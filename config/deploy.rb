#require 'bundler/capistrano'

#set :default_environment, {
#  'PATH' => "/home/deploy/.rvm/gems/ree-1.8.7-2010.02/bin:/home/deploy/.rvm/gems/ree-1.8.7-2010.02@global/bin:/home/deploy/.rvm/rubies/ree-1.8.7-2010.02/bin:/home/deploy/.rvm/bin:$PATH",
#  'RUBY_VERSION' => 'ruby 1.8.7',
#  'GEM_HOME'     => '/home/deploy/.rvm/gems/ree-1.8.7-2010.02',
#  'GEM_PATH'     => '/home/deploy/.rvm/gems/ree-1.8.7-2010.02:/home/deploy/.rvm/gems/ree-1.8.7-2010.02@global',
#  'BUNDLE_PATH'  => '/home/deploy/.rvm/gems/ree-1.8.7-2010.02'
#}

#default_run_options[:pty] = true

default_environment["LC_CTYPE"] = "en_US.UTF-8"

set :application, "bigbrother"
set :repository,  "http://marko.penzasoft.ru/svn/bigbrother/src/"
set :user, "deploy"
set :scm, :subversion
set :deploy_to, "/opt/bb/"
set :deploy_via, :export

role :web, "penzasoft.com"
role :app, "penzasoft.com"
role :db,  "penzasoft.com", :primary => true

after 'deploy', 'deploy:cleanup'
before 'deploy', 'deploy:update_footer'

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :update_footer, :roles => :app do
    system "svnversion > config/version.txt"
    system "date +\"%Y-%m-%d %H:%M:%S\" >> config/version.txt"
    system "svn ci config/version.txt -m \"deploy at #{Time.now.strftime("%F %T")}\""
  end
end


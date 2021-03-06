require 'resque/tasks'
require 'resque/scheduler/tasks'

namespace :resque do
  task setup: :environment

  task :restart_worker do
    pid_file = 'tmp/pids/resque_worker.pid'
    `kill -s QUIT #{File.read(pid_file).to_i}` if File.exist?(pid_file)
    `QUEUE=* PIDFILE=#{pid_file} BACKGROUND=yes \
     bundle exec rake resque:work`
  end

  task :restart_scheduler do
    pid_file = 'tmp/pids/resque_scheduler.pid'
    `kill -s QUIT #{File.read(pid_file).to_i}` if File.exist?(pid_file)
    `PIDFILE=#{pid_file} BACKGROUND=yes KEEP_PIDFILE=yes \
     bundle exec rake resque:scheduler`
  end

  task :restart do
    Rake::Task['resque:restart_worker'].invoke
    Rake::Task['resque:restart_scheduler'].invoke
  end
end

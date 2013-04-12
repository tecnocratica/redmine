worker_processes 1
working_directory File.expand_path(File.join(File.dirname(__FILE__), '..'))

preload_app true

timeout 30

listen "/tmp/redmine.socket", :backlog => 64

pid "/tmp/redmine.pid"

stderr_path "/tmp/redmine.stderr.log"
stdout_path "/tmp/redmine.stdout.log"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
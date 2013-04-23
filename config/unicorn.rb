worker_processes 1
working_directory "/var/www/sap/"

preload_app true

timeout 30

listen "/var/www/sap/tmp/sockets/unicorn.sock", :backlog => 64

pid "/var/www/sap/tmp/pids/unicorn.pid"

stderr_path "/var/www/sap/log/unicorn.stderr.log"
stdout_path "/var/www/sap/log/unicorn.stdout.log"

before_fork do |server, worker|
	defined?(ActiveRecord::Base) and
			ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
	defined?(ActiveRecord::Base) and
			ActiveRecord::Base.establish_connection
end
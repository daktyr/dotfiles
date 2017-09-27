function rrs
	kill -9 (cat tmp/pids/server.pid); rails server
end

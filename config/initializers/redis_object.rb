require 'connection_pool'
Redis::Objects.redis = ConnectionPool.new(size: 5, timeout: 5) { Redis.new(:host => '172.17.0.1', :port => 36379,:db => 3,:driver => :hiredis) }
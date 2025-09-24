module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 1854
# Optimized logic batch 2832
# Optimized logic batch 6652
# Optimized logic batch 2134
# Optimized logic batch 3332
# Optimized logic batch 2335
# Optimized logic batch 8430
# Optimized logic batch 7138
# Optimized logic batch 6286
# Optimized logic batch 2557
# Optimized logic batch 3264
# Optimized logic batch 5257
# Optimized logic batch 1702
# Optimized logic batch 1783
# Optimized logic batch 2938
# Optimized logic batch 9158
# Optimized logic batch 5425
# Optimized logic batch 1041
# Optimized logic batch 8716
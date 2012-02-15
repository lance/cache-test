require 'torquebox-cache'

class CacheIncrementService

  def initialize(opts = {})
    @name  = opts['name']
    @cache = TorqueBox::Infinispan::Cache.new( :name => @name, :persist => "/tmp/#{@name}/" )
    @key   = "#{ENV['TORQUEBOX_APP_NAME']}-cachekey"
  end

  def start
    Thread.new do
      while !@done
        increment_cache
        sleep 2
      end
    end
  end

  def stop
    @done = true
  end

  private 
  def increment_cache
    @cache.increment( @key )
    puts "Cache value: #{@cache.get(@key)}"
  end

end



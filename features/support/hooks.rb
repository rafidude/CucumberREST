require 'childprocess' 
require 'timeout' 
require 'httparty'

Before do 
  @server = ChildProcess.build("rackup", "--port", "9999") 
  @server.start 
  Timeout.timeout(3) do
    loop do 
      begin
        HTTParty.get('http://localhost:9999')
        break 
      rescue Errno::ECONNREFUSED => try_again
        sleep 0.1
      end 
    end
  end 
end

After do 
  @server.stop
end
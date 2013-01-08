require 'net/http'

pages = %w( http://www.dell.com
						http://www.apple.com
						http://www.google.co.uk
						http://www.nauta.com
						http://www.engadget.com
						http://www.yahoo.com )

threads = []

pages.each do |page|
	threads << Thread.new(page) do |uri|
		p "Fetching: #{page}..."
		resp = Net::HTTP.get_response(URI(uri))
		p "Got #{page}: #{resp.message}"
	end
end

threads.each{|t| t.join}
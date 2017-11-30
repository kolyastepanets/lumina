require 'net/http'

desc 'Wake up heroku'
task wake_up_heroku: :environment do
  uri = URI.parse('http://www.lumina.dp.ua/')
  response = Net::HTTP.get_response(uri)
  puts response.body
end

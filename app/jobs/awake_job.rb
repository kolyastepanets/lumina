require 'net/http'

class AwakeJob < ApplicationJob
  queue_as :default

  def perform(*)
    uri = URI.parse('http://www.lumina.dp.ua/')
    response = Net::HTTP.get_response(uri)
    puts response.body
  end
end

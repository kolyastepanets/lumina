Instagram.configure do |config|
  config.client_id = Figaro.env.intagram_api_key
  config.client_secret = Figaro.env.intagram_api_secret
end

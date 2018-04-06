CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     Figaro.env.aws_key_id,
      aws_secret_access_key: Figaro.env.aws_key_secret,
      region:                Figaro.env.aws_region
    }
    config.fog_directory = 'lumina-production'
    config.fog_public    = true
    config.storage       = :fog
  else
    config.storage = :file
  end
end

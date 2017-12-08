CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     Figaro.env.aws_key_id,
    aws_secret_access_key: Figaro.env.aws_key_secret,
    region:                Figaro.env.aws_region
  }
  config.fog_directory = Figaro.env.s3_bucket_name
  config.fog_public    = true
  config.storage       = :fog
end

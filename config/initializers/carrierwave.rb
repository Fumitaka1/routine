# frozen_string_literal: true

CarrierWave.configure do |config|
  config.fog_directory = ENV['AWS_S3_BUCKET']
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }

  config.fog_public     = true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }

  config.fog_directory  = 'rotine'
  config.cache_storage = :fog
end

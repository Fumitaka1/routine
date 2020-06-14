CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_directory = ENV['AWS_S3_BUCKET']
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
      aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
      region: 'ap-northeast-1'
  }

  # 公開・非公開の切り替え
  config.fog_public     = true
  # キャッシュの保存期間
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }

  config.fog_directory  = 'rotine'
  config.cache_storage = :fog

end

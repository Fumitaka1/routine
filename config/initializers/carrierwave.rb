CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_directory = ENV['AWS_S3_BUCKET']
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIATBKNJGCF6IGUOEUP',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
  }

  # 公開・非公開の切り替え
  config.fog_public     = true
  # キャッシュの保存期間
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }

  config.fog_directory  = 'rotine'
  config.cache_storage = :fog

end

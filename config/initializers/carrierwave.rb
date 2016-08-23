CarrierWave.configure do |config|
    config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.s3.access_key,
    aws_secret_access_key: Settings.s3.secret_access_key,
    region: 'us-east-1'
  }

    case Rails.env
    when 'development'
        config.fog_directory  = 'upload-prototype-images'
        config.asset_host = 'https://s3.amazonaws.com/upload-prototype-images'
    when 'production'
        config.fog_directory  = 'upload-prototype-images'
        config.asset_host = 'https://s3.amazonaws.com/upload-prototype-images'
    end
end

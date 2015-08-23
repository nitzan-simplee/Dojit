CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAI7R26RLTPWSUO53A',
    # ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: '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'
    # ENV['AWS_SECRET_ACCESS_KEY'],
  }
  config.fog_directory = 'nitzan-oto-dojit-dev',
  # ENV['AWS_BUCKET'],
  config.fog_public = true
end
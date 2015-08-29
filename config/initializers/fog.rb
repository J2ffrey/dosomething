CarrierWave.configure do |config|
    config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIRCDKJWTC6J5YKDA',                                            # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'                  # optional, defaults to 'us-east-1'
  }
    config.fog_directory  = 'bongsa'                          # required
end
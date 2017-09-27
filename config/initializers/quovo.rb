  Quovo.configure do |config|
    config.username               = 'gerbonilla@gmail.com'
    config.password               = ENV["QUOVO_PASSWORD"]
    config.request_timeout        = 30.seconds # by default 60 seconds
    config.token_ttl              = 2.hour     # by default 1 hour
    config.token_prefix           = 'APP-NAME' # add custom prefix for token (helps to manage token list)
    config.debug                  = true # if you want to see detailed logs
    config.strip_sensitive_params = true # show [FILTERED] in logs for sensitive data
  end

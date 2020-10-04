Recaptcha.configure do |config|
  config.site_key  = ENV['RECAPTCHA_SITE_KEY'] || 'blabla'
  config.secret_key = ENV['RECAPTCHA_SECRET_KEY'] || 'blublub'
end
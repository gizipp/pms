ActionMailer::Base.smtp_settings = {
  :address   => "smtp.mandrillapp.com",
  :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
  :enable_starttls_auto => true, # detects and uses STARTTLS
  :user_name => "dwi@softwareseni.com",
  :password  => "ehqL_EBTxDfrsjKdT1J4dA", # SMTP password is any valid API key
  :authentication => 'login', # Mandrill supports 'plain' or 'login'
  :domain => 'agentaccountdev.com', # your domain to identify your server when connecting
}
class ApplicationMailer < ActionMailer::Base
  # development settings
  # will need to change to production settings later
  default from: "team@twixt.com"
  default_url_options[:host] = "localhost:3000"
  layout 'mailer'
end

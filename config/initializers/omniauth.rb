#config/initalizers/omniauth.rb
 OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.secrets.client_id, Rails.application.secrets.client_secret, {
  scope: ['email',
    'https://www.googleapis.com/auth/gmail.modify'],
    access_type: 'offline',
  }
end
Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :facebook, '688599717824664', 'e6c892a3c2fd9c19fcb709d6bec6e97f'
  #provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
   # provider :facebook, '1205387996155988', '5db3c36b7e5670e1c90fd36948816ae4', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
   provider :facebook, '437990293065475', 'e44977356101a666824b827b8d9b6d57', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
  
end
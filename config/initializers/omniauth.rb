OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '994811058182-08n10prgr5h0lrfg3mddmtt51mcupdjr.apps.googleusercontent.com', '_OGRbd0c5lijgHvFBJXTkSo_', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end

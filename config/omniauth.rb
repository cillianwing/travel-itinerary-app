Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '7c1cf9fa2a1770a9dfb2', '0b1f37ed53e76fcf1144415c5bb8a0786b69df42'
end

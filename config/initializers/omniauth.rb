Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "NlVSfVumkRUgQtTpNzHjQ", "wk2IxvzHB7CJpH4aPMd7lmV4rJGYYminXtCj6oVwuE"
  provider :facebook, "1435867126624836", "5f917ec808e78f8e36aa30ab5337f61f"
  provider :linkedin, "770hov8cbp2osf", "aoX68F8r0Zr0zV5c"
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
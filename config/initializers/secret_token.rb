# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
if Rails.env.development? or Rails.env.test?
  BattleNetInformant::Application.config.secret_token = '45a9cc5f972f0dcd52f663214418ea354e9097f9d83802ab9e2214ba823f179c1a64bee6a636f4f2654140e9323c32cb43e3f47b0371e4332097bda06edcfb7d'
else
  BattleNetInformant::Application.config.secret_token = ENV['SECRET_TOKEN']
end
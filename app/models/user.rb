class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.login_field            = :email
    c.crypted_password_field = :encrypted_password
    c.crypto_provider        = Authlogic::CryptoProviders::BCrypt
  end
end

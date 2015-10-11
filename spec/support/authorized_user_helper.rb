require 'authlogic/test_case'

module AuthorizedUserHelper
  include Authlogic::TestCase

  def login_as_authorized_user
    activate_authlogic
    user = User.create!(
        :username => 'steph',
        :email => "an@email.com",
        :password => 'areallylongandsecurepassword',
        :password_confirmation => 'areallylongandsecurepassword',
      )
    UserSession.create(user)
  end
end

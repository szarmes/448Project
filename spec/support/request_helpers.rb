require 'spec_helper'
include Warden::Test::Helpers

module RequestHelpers
  def create_logged_in_user
    user = FactoryGirl.create(:user, :employee)
    login(user)
    user
  end
  def create_logged_in_employer
    user = FactoryGirl.create(:user, :employer)
    login(user)
    user
  end

  def login(user)
    login_as user, scope: :user
  end
end
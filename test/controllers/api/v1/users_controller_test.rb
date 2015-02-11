require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase
#without logged in user, get error
#with logged in user, get correct user.

  test "not valid user return 500" do
    sign_out :user
    assert_raises(CanCan::AccessDenied) {get :current}
  end

  test "get valid user" do
    assert get :current
  end

end



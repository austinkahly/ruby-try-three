require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "create registered user" do
    user = create(:user)
    assert_equal user.role, Role.find_by_name("registered")
  end

  test "create admin user" do
    user = create(:admin)
    assert_equal user.role, Role.find_by_name("admin")
  end

end

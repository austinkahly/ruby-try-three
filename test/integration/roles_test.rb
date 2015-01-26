require 'test_helper'
 
class RolesTest < ActionDispatch::IntegrationTest
  
  setup do
    @password = 'password'
    @user = create(:admin, password: @password)
  end

  test "sign in and browse" do
    #Not sure how to do much more with this yet.
    #get_via_redirect "/articles"
    #assert_response :success

    #article = create(:article)

    #get "/articles/#{article.id}"
    #assert_response :success


  end
end
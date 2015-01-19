ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include FactoryGirl::Syntax::Methods
  #fixtures :all
  def setup
     load "#{Rails.root}/db/seeds.rb"
   end
end

class ActionController::TestCase
 include Devise::TestHelpers

  def setup
    #@request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in create(:user)
  end

  def teardown
    # make sure nobody is left signed in
    sign_out :user
  end

end

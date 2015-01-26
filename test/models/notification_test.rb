require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  
  test "create notification" do
    comment = create(:comment)
    assert_not_nil(Notification.find(comment.id))
  end

end

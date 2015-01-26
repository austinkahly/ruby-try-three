require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  
  test "create notification" do
    comment = create(:comment)
    assert(Notification.where(comment_id: comment.id).present?)
  end

end

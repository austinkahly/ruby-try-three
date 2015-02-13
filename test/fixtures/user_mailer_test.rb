require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  
  test "comment created" do 
    admin = create(:admin)
    email = UserMailer.comment_create(admin.id).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['austin@wantable.com'], email.from
    assert_equal [admin.email], email.to
    assert_equal 'Comment create', email.subject
  end

  test "welcome email" do
    admin = create(:admin)
    email = UserMailer.welcome_email(admin.id)
    assert_equal ['austin@wantable.com'], email.from
    assert_equal [admin.email], email.to
    assert_equal 'Welcome to my awesome site!', email.subject
  end

  test "notification creates email" do
    article_creator = create(:admin)
    article = create(:article, user_id: article_creator.id)
    comment_creator = create(:admin)
    comment = create(:comment, article_id: article.id, user_id: comment_creator.id )
    notification = Notification.last
    assert_equal notification.comment_id, comment.id
    assert_equal notification.user_id, article_creator.id
  end

end
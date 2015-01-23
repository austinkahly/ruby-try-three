require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  test "should create comment" do
    comment_attr = attributes_for(:comment, user_id: @user.id)
    assert_difference('Comment.count') do
      post :create, comment: comment_attr, article_id: comment_attr[:article_id]
    end
  end

  test "should destroy comment" do
    comment = create(:comment, user_id: @user.id)

    assert_difference('Comment.count', -1) do
      delete :destroy, id: comment.id, article_id: comment[:article_id]
    end
  end

  test "should validate comment" do
    comment_attr = attributes_for(:comment, body: nil, user_id: @user.id)
    comment = post :create, comment: comment_attr, article_id: comment_attr[:article_id]
    assert_not comment["id"]
  end

  test "registered user cannot delete comment they did not create" do
    article = create(:article)
    comment = create(:comment, article_id: article.id, user_id: @user.id)
    sign_out @user
    user = create(:user)
    sign_in user
    assert_raises(CanCan::AccessDenied) do
      delete :destroy, id: comment.id, article_id: comment[:article_id]
    end
  end
end

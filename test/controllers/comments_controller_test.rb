require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  
  test "should create comment" do
    comment_attr = attributes_for(:comment)
    assert_difference('Comment.count') do
      post :create, comment: comment_attr, article_id: comment_attr[:article_id]
    end
  end

  test "should validate commenter" do
    comment_attr = attributes_for(:comment, commenter: nil)
    comment = post :create, comment: comment_attr, article_id: comment_attr[:article_id]
    assert_not comment["id"]
  end

  test "should destroy comment" do
    comment = create(:comment)

    assert_difference('Comment.count', -1) do
      delete :destroy, id: comment.id, article_id: comment[:article_id]
    end
  end

  test "should validate comment" do
    comment_attr = attributes_for(:comment, body: nil)
    comment = post :create, comment: comment_attr, article_id: comment_attr[:article_id]
    assert_not comment["id"]
  end

end

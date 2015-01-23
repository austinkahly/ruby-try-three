class Api::V1::CommentsController < Api::V1::BaseController
  
  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :article_id)
  end

end

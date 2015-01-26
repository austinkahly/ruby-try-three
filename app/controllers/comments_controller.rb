class CommentsController < ApplicationController

  before_filter :load_article
  load_and_authorize_resource

  def create
    @comment.article_id = params[:article_id]
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to article_path(@article)
    else 
      render "articles/show"
    end
  end

  def destroy
    @notification = Notification.where(:comment_id == @comment.id)
    if @notification.nil?
      @notification.destroy
    end
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def load_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :body, :article_id)
  end
end

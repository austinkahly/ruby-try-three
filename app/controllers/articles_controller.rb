class ArticlesController < ApplicationController

  #load_and_fill_resource

  def index
    @articles = Article.all
  end

  def new  
  end 

  def create
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
 
  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
    @comment = @article.comments.build
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end


  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end

class Api::V1::ArticlesController < Api::V1::BaseController
  
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end

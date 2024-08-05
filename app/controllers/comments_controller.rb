class CommentsController < ApplicationController
  http_basic_authenticate_with name:'rohan', password: 'rohan', only: :destroy
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to @article 
    # if @comment.save
    # else
    #   render articles_path(@article), status: :unprocessable_entity
    # end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end

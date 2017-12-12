class CommentsController < ApplicationController
  respond_to :js

  def create
    @comment = Comment.create(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body, :email, :article_id)
  end
end

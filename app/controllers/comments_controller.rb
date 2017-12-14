class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if verify_recaptcha(model: @comment) && @comment.save
      flash[:success] = 'Спасибо йо! йо! йо!'
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
    end
    redirect_to article_path(Article.find(comment_params[:article_id]))
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body, :email, :article_id)
  end
end

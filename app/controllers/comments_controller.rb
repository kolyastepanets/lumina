class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if verify_recaptcha(model: @comment, message: I18n.t('comment.captcha_fail')) && @comment.save
      flash[:success] = I18n.t('comment.success_created')
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

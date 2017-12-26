module ArticlesHelper
  def month_russian_name(date)
    english_month_name = date.match(/\D+/).to_s.underscore
    year = date.match(/\d+/).to_s
    I18n.t("month.#{english_month_name}", year: year)
  end

  def text_leave_comment(article)
    if article.comments.exists?
      I18n.t('comments', count: article.comments.count)
    else
      I18n.t('comment.text_leave_comment')
    end
  end
end

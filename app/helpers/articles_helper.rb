module ArticlesHelper
  def month_russian_name(date)
    english_month_name = date.match(/\D+/).to_s.underscore
    year = date.match(/\d+/).to_s
    I18n.t("month.#{english_month_name}", year: year, locale: :ru)
  end

  def text_leave_comment(article)
    if article.comments.exists?
      I18n.t('comments', count: article.comments.count, locale: :ru)
    else
      'Оставить комментарий'
    end
  end
end

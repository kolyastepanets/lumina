module ArticlesHelper
  def month_russian_name(date)
    english_month_name = date.match(/\D+/).to_s.underscore
    year = date.match(/\d+/).to_s
    I18n.t(english_month_name, year: year, locale: :ru)
  end
end

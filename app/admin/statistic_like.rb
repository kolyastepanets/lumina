ActiveAdmin.register StatisticLike do
  actions :all, except: %i[new create edit update destroy]

  index do
    column 'Кол-во лайков', :quantity
    column 'Начало', &:created_at
    column 'Конец', &:updated_at
    actions
  end

  show do
    attributes_table do
      rows :quantity, :created_at, :updated_at
    end
  end
end

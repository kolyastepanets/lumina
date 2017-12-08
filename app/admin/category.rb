ActiveAdmin.register Category do
  controller do
    def permitted_params
      params.permit!
    end
  end

  after_save do |category|
    category.update(english_title: Translit.convert(category.title, :english).gsub(/(\s+|')/, ''))
  end

  show do
    attributes_table do
      rows :title
    end
  end

  form do |f|
    f.inputs do
      f.input :title
    end

    f.actions
  end
end

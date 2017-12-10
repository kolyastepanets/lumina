ActiveAdmin.register Category, as: 'Portfolio Categories' do
  controller do
    def scoped_collection
      Category.portfolio
    end

    def permitted_params
      params.permit!
    end
  end

  after_save do |category|
    category.update(english_title: Translit.convert(category.title, :english).gsub(/(\s+|')/, ''))
  end

  index do
    column :title
    actions
  end

  show do
    attributes_table do
      rows :title
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :classification, input_html: { value: 'portfolio' }, as: :hidden
    end

    f.actions
  end
end

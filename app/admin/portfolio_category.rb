ActiveAdmin.register Category, as: 'Portfolio Categories' do
  controller do
    def scoped_collection
      Category.portfolio
    end

    def permitted_params
      params.permit!
    end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  after_save do |category|
    category.update(english_title: Translit.convert(category.title, :english).gsub(/(\s+|')/, ''))
  end

  index do
    column :title
    column :slug
    actions
  end

  show do
    attributes_table do
      rows :title, :slug
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :slug
      f.input :classification, input_html: { value: 'portfolio' }, as: :hidden
    end

    f.actions
  end
end

ActiveAdmin.register Category, as: 'Blog Categories' do
  controller do
    def scoped_collection
      Category.blog
    end

    def permitted_params
      params.permit!
    end
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
      f.input slug
      f.input :classification, input_html: { value: 'blog' }, as: :hidden
    end

    f.actions
  end
end

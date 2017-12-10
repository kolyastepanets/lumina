ActiveAdmin.register Article do
  controller do
    def permitted_params
      params.permit!
    end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  show do |article|
    attributes_table do
      row :main_image do
        image_tag article.main_image
      end
      rows :title, :slug, :category, :description
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :slug
      f.input :main_image, as: :file
      f.input :description
      f.input :categories,
              as: :select,
              input_html: { multiple: true, class: 'chosen-input' },
              collection: Category.blog
    end

    f.actions
  end
end

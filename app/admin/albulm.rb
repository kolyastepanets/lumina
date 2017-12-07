ActiveAdmin.register Albulm do
  controller do
    def permitted_params
      params.permit!
    end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :title_photo do |albulm|
      image_tag albulm.title_photo
    end
    column :title
    column :slug
    column :category
    actions
  end

  show do |albulm|
    attributes_table do
      row :title_photo do
        image_tag albulm.title_photo
      end
      rows :title, :slug, :category, :description
      row :images do
        ul do
          albulm.images.each do |image|
            li do
              image_tag(image.url)
            end
          end
        end
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :title
      f.input :slug
      f.input :title_photo, as: :file
      f.input :description
      f.input :category
      f.input :images, as: :file, input_html: { multiple: true }
    end

    f.actions
  end
end

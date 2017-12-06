ActiveAdmin.register Albulm do
  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    column :title_photo do |albulm|
      image_tag albulm.title_photo
    end
    column :title
    column :slug
    column :category
    actions name: 'Actions', defaults: true
  end

  show do |albulm|
    attributes_table do
      row :title_photo do
        image_tag albulm.title_photo
      end
      rows :title, :slug, :category
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :title_photo, as: :file
      f.input :category

      f.has_many :images do |p|
        p.input :file
      end
    end

    f.actions
  end
end

ActiveAdmin.register LandingImage do
  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    column :file do |landing_image|
      image_tag landing_image.file.small
    end
    actions
  end

  show do |landing_image|
    attributes_table do
      row :file do
        image_tag landing_image.file.small
      end
    end
  end
end

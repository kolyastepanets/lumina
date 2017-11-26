ActiveAdmin.register Albulm do
  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs do
      f.input :title

      f.has_many :images do |p|
        p.input :file
      end
    end

    f.actions
  end
end

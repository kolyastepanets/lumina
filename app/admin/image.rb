ActiveAdmin.register Image do
  controller do
    def permitted_params
      params.permit!
    end
  end
end

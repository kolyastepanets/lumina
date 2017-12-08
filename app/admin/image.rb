ActiveAdmin.register Image do
  menu false

  controller do
    def permitted_params
      params.permit!
    end

    def destroy
      destroy! { edit_admin_albulm_path(permitted_params['albulm_id']) }
    end
  end
end

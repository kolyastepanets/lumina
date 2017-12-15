ActiveAdmin.register Image do
  jcropable
  menu false

  controller do
    def permitted_params
      params.permit!
    end

    def update
      update! do |success, _failure|
        success.html { redirect_to edit_admin_albulm_path(permitted_params['image']['albulm_id']) }
      end
    end

    def destroy
      destroy! { edit_admin_albulm_path(permitted_params['albulm_id']) }
    end
  end

  form do |f|
    f.inputs do
      f.input :file, as: :jcropable, jcrop_options: { aspectRatio: 1 }
      f.input :albulm
    end

    f.actions
  end
end

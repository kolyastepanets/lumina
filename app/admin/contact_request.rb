ActiveAdmin.register ContactRequest do
  actions :all, except: %i[new edit destroy]

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    column :name
    column :email
    column :subject
    column :body
    actions
  end
end

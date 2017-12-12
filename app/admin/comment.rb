ActiveAdmin.register Comment, as: 'ArticleComment' do
  actions :all, except: %i[new create edit update destroy]

  controller do
    def permitted_params
      params.permit!
    end
  end
end

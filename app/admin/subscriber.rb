ActiveAdmin.register Subscriber do
  actions :all, except: %i[new create edit update destroy]

  filter :name
  filter :email
  filter :active

  controller do
    def permitted_params
      params.permit!
    end
  end

  show do |subscriber|
    attributes_table do
      rows :name, :email, :active
      row 'Полученные емейлы' do
        div do
          subscriber.mails.each do |mail|
            div do
              mail.subject
            end
            div do
              mail.body.html_safe
            end
          end
        end
      end
    end
  end
end

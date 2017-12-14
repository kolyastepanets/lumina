ActiveAdmin.register MailgunMail, as: 'Email' do
  actions :all, except: %i[edit update destroy]

  controller do
    def permitted_params
      params.permit!
    end
  end

  after_save do |mail|
    OfficeMailer.send_message(mail).deliver_later
  end

  index do
    column :sent_to
    column :subject
    column :body do |mail|
      mail.body.html_safe
    end
    actions
  end

  show do
    attributes_table do
      rows :sent_to, :subject
      row :body do |mail|
        mail.body.html_safe
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :sent_to
      f.input :subject
      f.input :body, as: :ckeditor
      f.input :classification, input_html: { value: 'sent' }, as: :hidden
    end

    f.actions
  end
end

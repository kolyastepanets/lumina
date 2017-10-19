ActiveAdmin.register MailgunMail, as: 'Email' do
  actions :all, except: %i[edit update destroy]

  controller do
    def permitted_params
      params.permit!
    end

    def create
      create! do |success, _failure|
        success.html do
          if resource.multiple_emails.present?
            create_and_send_multiple_emails(resource)
          else
            OfficeMailer.delay.send_message(resource)
          end
          redirect_to(collection_url)
        end
      end
    end

    def create_and_send_multiple_emails(resource)
      Subscriber.active.find_each do |subscriber|
        SubscriberMailgunMail.create(subscriber_id: subscriber.id, mailgun_mail_id: resource.id)
        id = Rails.application.message_verifier(:unsubscribe).generate(subscriber.id)
        SubscriberMailer.delay.send_message(resource, subscriber, id)
      end
    end
  end

  index do
    column :sent_to
    column :subject
    column :body do |mail|
      mail.body.html_safe
    end
    actions
  end

  show do |mail|
    attributes_table do
      if mail.sent_to.present?
        row :sent_to
      else
        row 'Кому отправлены емейлы' do
          div do
            mail.subscribers.each do |subscriber|
              div class: 'subscriber' do
                div do
                  subscriber.name
                end
                div do
                  subscriber.email
                end
              end
            end
          end
        end
      end
      row :subject
      row :body do
        mail.body.html_safe
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :sent_to
      f.input :multiple_emails, as: :boolean,
                                checked_value: true,
                                unchecked_value: '',
                                label: 'Сделать рассылку для подписчиков'
      f.input :subject
      f.input :body, as: :ckeditor
      f.input :classification, input_html: { value: 'sent' }, as: :hidden
    end

    f.actions
  end
end

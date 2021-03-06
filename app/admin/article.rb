ActiveAdmin.register Article do
  jcropable

  controller do
    def permitted_params
      params.permit!
    end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :main_image, 'Большая главная картинка' do |article|
      image_tag article.main_image.thumb.url
    end
    column :small_main_image, 'Маленькая главная картинка' do |article|
      image_tag article.small_main_image.thumb.url
    end
    column :title
    column :slug
    column :preview_description do |article|
      truncate(article.preview_description, omision: '...', length: 200)
    end
    column :description do |article|
      truncate(article.description, omision: '...', length: 300)
    end
    column(:categories) do |article|
      div do
        article.categories.each do |category|
          div do
            category.title
          end
        end
      end
    end
    actions
  end

  show do |article|
    attributes_table do
      row :main_image do
        image_tag article.main_image.thumb
      end
      row :small_main_image, 'Маленькая главная картинка' do
        image_tag article.small_main_image.thumb
      end
      rows :title, :slug, :category, :preview_description
      row :description do
        article.description.html_safe
      end
      row 'Comments' do
        div do
          article.comments.each do |comment|
            div class: 'article' do
              div do
                span 'Имя:'
                span comment.name
              end
              div do
                span 'Email:'
                span comment.email
              end
              div do
                span 'Текст:'
                span comment.body
              end
            end
          end
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :slug
      f.input :main_image, as: :jcropable, jcrop_options: { aspectRatio: 1 }
      f.input :small_main_image, as: :jcropable, jcrop_options: { aspectRatio: 1 }
      f.input :preview_description
      f.input :description, as: :ckeditor
      f.input :categories,
              as: :select2_multiple,
              collection: Category.blog,
              multiple: true,
              input_html: { class: 'category-select', value: object.categories.pluck(:title) }
    end

    f.actions
  end
end

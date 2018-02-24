ActiveAdmin.register Albulm do
  jcropable

  controller do
    def permitted_params
      params.permit!
    end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end

    def create
      @albulm = Albulm.new(permitted_params[:albulm].except('images_attributes'))

      if @albulm.save
        create_images
        redirect_to admin_albulms_path
      else
        render :new
      end
    end

    def update
      @albulm = Albulm.friendly.find(params[:id])

      if @albulm.update(permitted_params[:albulm].except('images_attributes'))
        create_images
        redirect_to admin_albulms_path
      else
        render :new
      end
    end

    def create_images
      return unless permitted_params[:albulm][:images_attributes]
      permitted_params[:albulm][:images_attributes][:file].each do |file|
        @albulm.images.create!(file: file, albulm_id: @albulm.id)
      end
    end
  end

  index do
    column :title_photo do |albulm|
      image_tag albulm.title_photo.thumb
    end
    column :title
    column :slug
    column :category do |albulm|
      span do
        link_to albulm.category.title, admin_portfolio_category_path(albulm.category)
      end
    end
    actions
  end

  show do |albulm|
    attributes_table do
      row :title_photo do
        image_tag albulm.title_photo.thumb
      end
      rows :title, :slug, :category, :description
      row :images do
        ul do
          albulm.images.each do |image|
            li do
              image_tag(image.file.small.url)
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
      f.input :title_photo, as: :jcropable, jcrop_options: { aspectRatio: 1 }
      f.input :description, as: :ckeditor
      f.input :category, collection: Category.portfolio
      f.label 'Add images'
      f.fields_for :images_attributes do |image_fields|
        image_fields.file_field :file, multiple: true
      end
      resource.images.each do |image|
        li do
          div do
            image_tag(image.file.small.url)
          end
          div do
            link_to 'Edit image', edit_admin_image_path(image, albulm_id: resource.id)
          end
          div do
            link_to 'Delete image',
                    admin_image_path(image, albulm_id: resource.id),
                    method: :delete,
                    data: { confirm: 'Are you sure?' }
          end
        end
      end
    end

    f.actions
  end
end

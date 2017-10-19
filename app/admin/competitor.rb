ActiveAdmin.register Competitor do
  controller do
    def action_methods
      if Competitor.count.zero?
        super
      else
        super - ['new']
      end
    end

    def permitted_params
      params.permit!
    end
  end
end

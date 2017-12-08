module ActiveAdmin
  module Views
    class Footer < Component
      def build(_namespace)
        super id: 'footer'
        super style: 'display: none;'
      end
    end
  end
end

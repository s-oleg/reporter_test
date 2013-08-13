module Base
  class Api < Grape::API
    prefix 'api'
    version 'api', using: :header, vendor: 'base'
    format :json

    helpers do
      def current_user
        env['warden'].user
      end

      def authenticate!
        unless current_user
          error!('401 Unauthorized', 401)
        end
      end
    end

    resource :reports do
      get do
        binding.pry
        current_user.reports
      end
    end
  end
end
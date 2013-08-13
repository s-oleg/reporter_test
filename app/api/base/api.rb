module Base
  class Api < Grape::API
    prefix 'api'
    version 'v1', using: :header, vendor: 'base'
    format :json

    resource :test do
      get do

      end
    end
  end
end
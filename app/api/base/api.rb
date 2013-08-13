module Base
  class Api < Grape::API
    prefix 'api'
    version 'api', using: :header, vendor: 'base'
    format :json

    resource :reports do
      get do
        Report.all.to_json
      end

      get ':id' do
        Report.find(params[:id])
      end

      post do
        report = Report.new
        report.assign_attributes(params[:data])
        report.save
      end

      put ':id' do
        report = Report.find(params[:id])
        report.assign_attributes(params[:data])
        report.save
      end

      delete ':id' do
        Report.destroy(params[:id])
      end
    end
  end
end

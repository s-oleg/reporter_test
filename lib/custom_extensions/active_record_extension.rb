module ActiveRecordExtension
  extend ActiveSupport::Concern

  module ClassMethods
    def filter_by(attr, value)
      where("#{attr} like '%#{value}%'")
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecordExtension) 

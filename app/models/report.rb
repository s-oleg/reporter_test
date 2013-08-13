class Report < ActiveRecord::Base
  belongs_to :user

  attr_accessible :description, :height, :length, :name, :width, :user_id
end

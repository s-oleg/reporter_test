class Report < ActiveRecord::Base
  attr_accessible :description, :height, :length, :name, :width
end

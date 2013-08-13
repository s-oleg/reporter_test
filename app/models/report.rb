class Report < ActiveRecord::Base
  belongs_to :user

  attr_accessible :description, :height, :length, :name, :width, :user_id

  validates :description, :height, :length, :name, :width, :user_id, presence: true
  validates :height, :length, :width, :user_id, numericality: true
end

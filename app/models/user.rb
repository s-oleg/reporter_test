class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role

  has_many :reports

  belongs_to :role

  after_create :add_role

  delegate :name, to: :role, prefix: true

  private

  def add_role
    self.role = Role.find_by_name('reporter')
    save
  end
end

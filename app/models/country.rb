class Country < ActiveRecord::Base
  has_many :users
  
  validates :name, :presence => true
  validates :point, :numericality => true
end

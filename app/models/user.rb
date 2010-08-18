class User < ActiveRecord::Base
  belongs_to :country
  
  validates :name, :uniqueness => true,
                   :presence => true
  validates :point, :numericality => true
  validates :country_id, :numericality => true,
                         :presence => true
  validates :device_id, :presence => true,
                        :uniqueness => true
end

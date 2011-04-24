class Agent < ActiveRecord::Base
  belongs_to :user
  has_one :profil
  accepts_nested_attributes_for :user
  
  validates_presence_of :name
  validates_associated :profil
  #validates_uniqueness_of :vatregno
end

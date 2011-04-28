class Category < ActiveRecord::Base
  has_many :profils
  has_many :searches
  validates_associated :profils
  
  attr_accessible :name
end

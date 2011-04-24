class Category < ActiveRecord::Base
  has_many :profils
  validates_associated :profils
end

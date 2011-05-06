class Address < ActiveRecord::Base
  has_many :agent
  has_many :principal
  #accepts_nested_attributes_for :agent
  #accepts_nested_attributes_for :principal
  
end

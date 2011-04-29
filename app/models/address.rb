class Address < ActiveRecord::Base
  belongs_to :agent
  has_one :principal
  #accepts_nested_attributes_for :agent
  accepts_nested_attributes_for :principal
  
end

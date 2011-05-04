class Address < ActiveRecord::Base
  belongs_to :agent
  belongs_to :principal
  #accepts_nested_attributes_for :agent
  #accepts_nested_attributes_for :principal
  
end

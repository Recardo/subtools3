class Request < ActiveRecord::Base
  belongs_to :principal
  accepts_nested_attributes_for :principal
  
  has_many :request_positions
end

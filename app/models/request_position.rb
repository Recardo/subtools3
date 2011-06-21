class RequestPosition < ActiveRecord::Base
  belongs_to :request  
  accepts_nested_attributes_for :request
  belongs_to :profil
end

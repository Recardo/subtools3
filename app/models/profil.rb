class Profil < ActiveRecord::Base
  belongs_to :agent  
  belongs_to :category
  
  attr_accessible :name, :active, :category_id
  
  validates_presence_of :category_id
end

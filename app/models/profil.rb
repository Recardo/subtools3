class Profil < ActiveRecord::Base
  acts_as_taggable
  
  belongs_to :agent  
  belongs_to :category
  
  attr_accessible :name, :active, :category_id, :tag_list
  
  validates_presence_of :category_id
end

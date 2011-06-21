class Profil < ActiveRecord::Base
  acts_as_taggable
  
  belongs_to :agent  
  belongs_to :category
  has_many :request_positions
  
  attr_accessible :name, :active, :category_id, :tag_list, :wage
  
  validates_presence_of :category_id
end

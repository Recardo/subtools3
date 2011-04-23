class Profil < ActiveRecord::Base
  belongs_to :agent  
  belongs_to :category
end

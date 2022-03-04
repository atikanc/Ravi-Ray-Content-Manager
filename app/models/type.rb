class Type < ApplicationRecord
  has_one_attached :TypeIcon
  has_many :projects
  validates :TypeName, presence: true
  
end

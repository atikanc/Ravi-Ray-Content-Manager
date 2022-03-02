class Type < ApplicationRecord
  has_many :projects
  has_one_attached :TypeIcon
  validates :TypeName, presence: true
end

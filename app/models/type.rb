class Type < ApplicationRecord
  has_one_attached :TypeIcon
  has_and_belongs_to_many :projects
end

class Project < ApplicationRecord
  has_one_attached :ProjectCover
  validates :TypeID, presence: true
end

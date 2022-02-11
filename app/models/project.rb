class Project < ApplicationRecord
  has_one_attached :ProjectCover
  validates :TypeID, presence: true
  has_one :Contribution, through: :DisplayLine
end

class Type < ApplicationRecord
  has_one_attached :TypeIcon
  belongs_to :Project
end

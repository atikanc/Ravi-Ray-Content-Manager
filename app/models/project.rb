class Project < ApplicationRecord
  has_one_attached :ProjectCover
  has_one :Type
end

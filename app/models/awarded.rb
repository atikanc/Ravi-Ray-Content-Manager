class Awarded < ApplicationRecord
  validates :AwardedDate, presence: true
  validates :AwardID, presence: true
  validates :ProjectID, presence: true
  has_one :project
  has_one :award
end

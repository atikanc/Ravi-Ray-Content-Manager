class DisplayLine < ApplicationRecord
  validates :ComponentContributed, presence: true
  validates :ComponentStartDate, presence: true
  validates :ComponentEndDate, presence: true
  validates :ContribProject, presence: true
  validates :ContribType, presence: true
end

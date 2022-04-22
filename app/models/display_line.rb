class DisplayLine < ApplicationRecord
    belongs_to :Contribution
    belongs_to :Project
    validates :ComponentStartDate, presence: true
    validates :ComponentEndDate, presence: true
    validates :Project, presence: true
    validates :Contribution, presence: true
end

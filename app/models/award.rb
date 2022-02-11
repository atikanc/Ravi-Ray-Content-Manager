class Award < ApplicationRecord
    validates :AwardName, presence: true
    validates :AwardYear, presence: true
    has_many :awardeds
end

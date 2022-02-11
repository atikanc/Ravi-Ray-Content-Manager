class Contribution < ApplicationRecord
    validates :ContributionType, presence: true
end

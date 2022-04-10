class Contribution < ApplicationRecord
    has_many :display_lines
    has_many :projects, through: :display_lines

    validates :ContributionType, presence: true
end

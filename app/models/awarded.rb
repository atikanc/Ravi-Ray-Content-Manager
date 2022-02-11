class Awarded < ApplicationRecord
    has_one :project
    has_one :award
end

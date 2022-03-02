class Project < ApplicationRecord
  has_one_attached :ProjectCover
  validates :TypeID, presence: true
  has_one :Contribution, through: :DisplayLine

  belongs_to :type
  def self.search(search)
    if search
      project_type = Project.find_by(TypeID: search)
      if project_type
        self.where(TypeID: project_type)
      else
        @projects = Project.all
      end
    else
      @projects = Project.all
    end
  end
end

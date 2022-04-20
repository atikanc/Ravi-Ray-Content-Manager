class Project < ApplicationRecord
  has_one_attached :ProjectCover
  validates :TypeID, presence: true
  has_many :display_lines
  has_many :contributions, through: :display_lines

  scope :TypeID, -> { where(id: TypeID)}
  # Ex:- scope :active, -> {where(:active => true)}

  # From https://stackoverflow.com/questions/36038646/string-interpolation-to-external-link-without-http
  # For Input Sanitization
  def ProjectLink=(url)
    if url.present?
      url = url.match(/https?:\/\//) ? url : "http://#{url}"
      write_attribute(:ProjectLink, url)
    end
  end
  

  def self.search(search)
    
    if search
      if search[:multibox].length > 0
        type_list = Array.new
        contribution_list = Array.new
        project_type = ""

        search[:multibox].each do |single|
          project_type = Type.find_by(TypeName: single)
          if project_type
            type_list.push(project_type)
          end
          
          project_type = Contribution.find_by(ContributionType: single)
          if project_type
            contribution_list.push(project_type)
          end
          
        end

        tids = Project.where(TypeID: type_list)
        pids = DisplayLine.where(Contribution: contribution_list).pluck(:Project_id)
        if (type_list.length > 0) && (contribution_list.length > 0)
          @projects = Project.where(id:pids).and(Project.where(TypeID: type_list))
        elsif (type_list.length > 0) && (contribution_list.length == 0)
          @projects = Project.where(TypeID: type_list)
        elsif (type_list.length == 0) && (contribution_list.length > 0)
          @projects = Project.where(id:pids)
        else
          @projects = Project.all
        end
      else
        @projects = Project.all
      end
    else
      @projects = Project.all
    end
  end

end

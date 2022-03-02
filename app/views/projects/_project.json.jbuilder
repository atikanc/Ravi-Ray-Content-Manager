json.extract!(project, :id, :ProjectName, :ProjectLink, :ProjectOwner, :ProjectStart, :ProjectEnd, :ProjectDescription, :ProjectCover,
              :ContributionID, :DisplayLineID, :AwardedID, :AwardID, :TypeID, :created_at, :updated_at
)
json.url(project_url(project, format: :json))
json.ProjectCover(url_for(project.ProjectCover))

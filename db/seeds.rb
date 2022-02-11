Award.create!([
  {AwardName: "Best Business/Finance Podcast Award", AwardLink: "", AwardYear: "2022-02-11"},
  {AwardName: "Best Business Podcast Award", AwardLink: "", AwardYear: "2022-02-11"},
  {AwardName: "Gold Award", AwardLink: "", AwardYear: "2022-02-11"}
])
Awarded.create!([
  {AwardedDate: "2022-02-11", AwardID: 1, ProjectID: 1, awards_id: nil, projects_id: nil}
])
Contribution.create!([
  {ContributionType: "Mastered"},
  {ContributionType: "Composed"},
  {ContributionType: "Mix Assistant"},
  {ContributionType: "Mixed"},
  {ContributionType: "Produced"}
])
DisplayLine.create!([
  {ComponentContributed: "Episode 4", ComponentStartDate: "2022-02-11", ComponentEndDate: "2022-02-11", ContribType: 1}
])
Project.create!([
  {ProjectName: "Macey", ProjectLink: "", ProjectOwner: "Max", ProjectStart: "2022-02-11", ProjectEnd: "2022-02-11", ProjectDescription: "", TypeID: 2}
])
Type.create!([
  {TypeName: "Music"},
  {TypeName: "Podcast"},
  {TypeName: "Audiobook"},
  {TypeName: "Film Scoring"},
  {TypeName: "Movie"},
  {TypeName: "Other"}
])

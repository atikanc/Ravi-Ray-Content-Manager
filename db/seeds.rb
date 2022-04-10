Type.create!([
  {TypeName: "Music"},
  {TypeName: "Podcast"},
  {TypeName: "Audiobook"},
  {TypeName: "Film Scoring"},
  {TypeName: "Movie"},
  {TypeName: "Other"}
])
Contribution.create!([
  {ContributionType: "Mastered"},
  {ContributionType: "Composed"},
  {ContributionType: "Mix Assistant"},
  {ContributionType: "Mixed"},
  {ContributionType: "Produced"},
])
Award.create!([
  {AwardName: "Best Business/Finance Podcast Award", AwardLink: "", AwardYear: "2022-02-11"},
  {AwardName: "Best Business Podcast Award", AwardLink: "", AwardYear: "2022-02-11"},
  {AwardName: "Gold Award", AwardLink: "", AwardYear: "2022-02-11"}
])
Project.create!([
  {ProjectName: "SLIPPY TOAD", ProjectLink: "https://www.youtube.com/watch?v=upKxlrGrPQI", ProjectOwner: "Bhloom", ProjectStart: "2022", ProjectEnd: "2022", ProjectDescription: "", TypeID: 1},
  {ProjectName: "missin you crazy (ravi's version)", ProjectLink: "https://www.youtube.com/watch?v=AmhyZDHMJKI", ProjectOwner: "ravi ray", ProjectStart: "2022", ProjectEnd: "2022", ProjectDescription: "", TypeID: 1},
  {ProjectName: "Redefining ABCD S3 Intro", ProjectLink: "https://www.youtube.com/watch?v=kH4YoClgFfg", ProjectOwner: "Keerthi Sekar & Sneha Ameya", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 1},
  {ProjectName: "Carol of the Bells", ProjectLink: "https://www.youtube.com/watch?v=XIqfU0NJers", ProjectOwner: "InnovatorsBox Studios", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 1},
  {ProjectName: "The Desi Condition S4 Intro", ProjectLink: "https://www.instagram.com/p/CTxIxtJLaAq/?utm_source=ig_web_copy_link", ProjectOwner: "Tanushree Sengupta", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 1},
  {ProjectName: "Here", ProjectLink: "https://www.youtube.com/watch?v=89agMs5d5do", ProjectOwner: "InnovatorsBox Studios", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 1},
  {ProjectName: "decisions", ProjectLink: "https://www.youtube.com/watch?v=XdxWJzpGpZI", ProjectOwner: "ravi ray", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 1},
  {ProjectName: "Pollen", ProjectLink: "https://www.youtube.com/watch?v=_bHLJY_Jk5M", ProjectOwner: "ravi ray", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 1},
  {ProjectName: "Salt Creek", ProjectLink: "https://www.youtube.com/watch?v=d9MRgxed06U", ProjectOwner: "Aaron Hanania & Shannon Rees", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 1},
  {ProjectName: "Intezaar", ProjectLink: "", ProjectOwner: "Kumar Roy", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 1},
  {ProjectName: "proud", ProjectLink: "https://www.youtube.com/watch?v=vmKn_C3rs10", ProjectOwner: "ravi ray", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 1},
  {ProjectName: "heartless (cover)", ProjectLink: "https://www.youtube.com/watch?v=NO33wgUx46s", ProjectOwner: "ravi ray & Ashley Bradley", ProjectStart: "2020", ProjectEnd: "2020", ProjectDescription: "", TypeID: 1},
  {ProjectName: "Masterpiece (cover)", ProjectLink: "https://www.youtube.com/watch?v=ADX5NKbChTM", ProjectOwner: "ravi ray", ProjectStart: "2019", ProjectEnd: "2019", ProjectDescription: "", TypeID: 1},
  {ProjectName: "South Asian Trailblazers, [S3 all episodes, S4 all episodes]", ProjectLink: "https://open.spotify.com/show/0iE60IOf14h5nhIABlfZQh?dl_branch=1&si=6Xf3wkw3TAqw0FF2CZ4qVQ&nd=1", ProjectOwner: "Simi Shah", ProjectStart: "2021", ProjectEnd: "2022", ProjectDescription: "", TypeID: 2},
  {ProjectName: "The Desi Condition [S2 ep. 12/15, S3 all episodes, S4 all episodes]", ProjectLink: "https://open.spotify.com/show/5UdzYH5e2V6b8owUtKaNnv?dl_branch=1&si=_Czm4gr7QdCefAyOv3KhuA&nd=1", ProjectOwner: "Tanushree Sengupta", ProjectStart: "2020", ProjectEnd: "2022", ProjectDescription: "", TypeID: 2},
  {ProjectName: "Dear Workplace [S1 all episodes, S2 ep. 2-10]", ProjectLink: "", ProjectOwner: "Monica Kang", ProjectStart: "2021", ProjectEnd: "2022", ProjectDescription: "", TypeID: 2},
  {ProjectName: "Curious Monica [S1 all episodes, S2 all episodes]", ProjectLink: "https://open.spotify.com/show/0PJRiFhrhLRA4GxeGfkIxB?dl_branch=1&si=Qp3uTcvcSQORkRCZSpnsqQ&nd=1", ProjectOwner: "Monica Kang", ProjectStart: "2021", ProjectEnd: "2022", ProjectDescription: "", TypeID: 2},
  {ProjectName: "Brown People We Know [S1 ep. 24-34]", ProjectLink: "https://open.spotify.com/show/5yf5bFrkdLLax3nOv67Y0P?dl_branch=1&si=calU7ivsTw6DcoLpthdQvQ&nd=1", ProjectOwner: "Suraj Kandukuri", ProjectStart: "2021", ProjectEnd: "2022", ProjectDescription: "", TypeID: 2},
  {ProjectName: "South Asian Stories [S1 ep. 30-32]", ProjectLink: "https://open.spotify.com/show/0Y4Ofv9in9s83DzJCLYzer?dl_branch=1&si=cADfeS2aSsWsARXvWjU1Qg&nd=1", ProjectOwner: "Sameer Desai", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 2},
  {ProjectName: "Strong Asian Lead [S1 ep. 5-12]", ProjectLink: "https://open.spotify.com/show/5vgqPKbNlqlamSddt8vhLB?dl_branch=1&si=98M_kGVmSDSAHdRHBsKpIg&nd=1", ProjectOwner: "David Moriya", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 2},
  {ProjectName: "Neat Beans & Collard Greens [S1 all episodes]", ProjectLink: "https://open.spotify.com/show/2d36BgqX1tP5ne7xaf7JIV?dl_branch=1&si=6jTBQglPRbCIoMq7mbmChw&nd=1", ProjectOwner: "David G./Bryan H.", ProjectStart: "2020", ProjectEnd: "2021", ProjectDescription: "", TypeID: 2},
  {ProjectName: "Rethink Creativity", ProjectLink: "Monica H. Kang", ProjectOwner: "Monica H. Kang", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 3},
  {ProjectName: "Who Will Rise Up", ProjectLink: "https://www.audible.com/pd/Who-Will-Rise-Up-Audiobook/B09FNS4Y8C", ProjectOwner: "Jed Smock", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 3},
  {ProjectName: "The Last Date [Short Film]", ProjectLink: "https://www.youtube.com/playlist?list=PLQTopKbVlKK4_iwLMwRomseOO18NNDHy9", ProjectOwner: "Adithya Rajan", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 4},
  {ProjectName: "Nima-Shyam Wedding [Bollywood Mashup]", ProjectLink: "", ProjectOwner: "Sidhi Patel", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 6},
  {ProjectName: "PARTH X TEMPLE AGNI [Bollywood Mashup]", ProjectLink: "https://www.youtube.com/watch?v=qFPKfX3wmiQ", ProjectOwner: "Parth Patel", ProjectStart: "2021", ProjectEnd: "2021", ProjectDescription: "", TypeID: 6},
  {ProjectName: "The Desi Condition S3 Intro", ProjectLink: "https://www.instagram.com/p/CBWF1T7lMft/?utm_source=ig_web_copy_link", ProjectOwner: "Tanushree Sengupta", ProjectStart: "2020", ProjectEnd: "2020", ProjectDescription: "", TypeID: 6}
])
Awarded.create!([
  {AwardedDate: "2022-02-11", AwardID: 1, ProjectID: 1, awards_id: 1, projects_id: 1},
  {AwardedDate: "2022-02-11", AwardID: 3, ProjectID: 1, awards_id: 1, projects_id: 1}
])
DisplayLine.create!([
  {ComponentContributed: "Episode 4", ComponentStartDate: "2022-02-11", ComponentEndDate: "2022-02-11", Project: Project.find_by(id: 1), Contribution: Contribution.find_by(id: 1)},
  {ComponentContributed: "Episode 7", ComponentStartDate: "2022-02-11", ComponentEndDate: "2022-02-11", Project: Project.find_by(id: 1), Contribution: Contribution.find_by(id: 1)}
])

# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Type, type: :model do
    subject do
      described_class.new(TypeName: 'Music')
    end
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  
    it 'is not valid without a name' do
      subject.TypeName = nil
      expect(subject).not_to be_valid
    end
end

RSpec.describe Contribution, type: :model do
  subject do
    described_class.new(ContributionType: 'Bao Type')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.ContributionType = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe Awarded, type: :model do
  subject do
    described_class.new(AwardedDate: '2022-02-14', AwardID: 1, ProjectID: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
    #check date
  it 'is not valid without a date' do
    subject.AwardedDate = nil
    expect(subject).not_to be_valid
  end

  #check Award ID
  it 'is not valid without a award id' do
    subject.AwardID = nil
    expect(subject).not_to be_valid
  end

  #check Project ID
  it 'is not valid without a project id' do
    subject.ProjectID = nil
    expect(subject).not_to be_valid
  end
end
  
  
RSpec.describe Project, type: :model do
  subject do
    described_class.new(ProjectName: 'a', ProjectLink: 'b', TypeID: '1')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a type ID' do
    subject.TypeID = nil
    expect(subject).not_to be_valid
  end

  it 'will find the projects by the type name' do
    music_type = Type.create(TypeName: 'random type')
    podcast_type = Type.create(TypeName: 'second random type')

    project_1 = Project.create( ProjectName: 'founder', 
                                ProjectLink: 'fake link', 
                                ProjectOwner: 'Atikan', 
                                ProjectStart: "2022-03-03",
                                ProjectEnd: "2022-03-03",
                                TypeID: music_type.id)
    project_2 = Project.create( ProjectName: 'not founder', 
                                ProjectLink: 'fake link', 
                                ProjectOwner: 'Alex', 
                                TypeID: podcast_type.id)
   
    dictionary = {:multibox => [music_type.TypeName]}
    @project = Project.search(dictionary)
    expect(@project.first).to eq(project_1)
  end

  it 'will show all projects if there is no project by a type name' do
    music_type = Type.create(TypeName: 'random_type')
    podcast_type = Type.create(TypeName: 'second_random_type')
    video_type = Type.create(TypeName: 'wassup')

    project_1 = Project.create( ProjectName: 'founder', 
                                ProjectLink: 'fake link', 
                                ProjectOwner: 'Atikan', 
                                ProjectStart: "2022-03-03",
                                ProjectEnd: "2022-03-03",
                                TypeID: music_type.id)
    project_2 = Project.create( ProjectName: 'not founder', 
                                ProjectLink: 'fake link', 
                                ProjectOwner: 'Alex', 
                                TypeID: podcast_type.id)
    
    dictionary = {:multibox => [video_type.id]}
    @project = Project.search(dictionary)
    expect(@project.length).to eq(2)
  end

  it 'will find the projects by the contribution type' do
    music_type = Type.create(TypeName: 'random_type')
    podcast_type = Type.create(TypeName: 'second_random_type')
    cont_type = Contribution.create(ContributionType: 'random_type')
    second_cont_type = Contribution.create(ContributionType: 'second random_type')
    

    project_1 = Project.create( ProjectName: 'founder', 
                                ProjectLink: 'fake link', 
                                ProjectOwner: 'Atikan', 
                                ProjectStart: "2022-03-03",
                                ProjectEnd: "2022-03-03",
                                TypeID: music_type.id)
    project_2 = Project.create( ProjectName: 'not founder', 
                                ProjectLink: 'fake link', 
                                ProjectOwner: 'Alex', 
                                TypeID: podcast_type.id)

    display_one = DisplayLine.create( Project_id: project_1.id,
                                      Contribution_id: cont_type.id)
    
    dictionary = {:multibox => [cont_type.id]}
    @project = Project.search(dictionary)
    expect(@project.first).to eq(project_1)
  end

  it 'will find the projects by the contribution type and project type' do
    music_type = Type.create(TypeName: 'random_type')
    podcast_type = Type.create(TypeName: 'second_random_type')
    cont_type = Contribution.create(ContributionType: 'random_type')
    second_cont_type = Contribution.create(ContributionType: 'second random_type')
    

    project_1 = Project.create( ProjectName: 'founder', 
                                ProjectLink: 'fake link', 
                                ProjectOwner: 'Atikan', 
                                ProjectStart: "2022-03-03",
                                ProjectEnd: "2022-03-03",
                                TypeID: music_type.id)
    project_2 = Project.create( ProjectName: 'not founder', 
                                ProjectLink: 'fake link', 
                                ProjectOwner: 'Alex', 
                                TypeID: podcast_type.id)

    display_one = DisplayLine.create( Project_id: project_1.id,
                                      Contribution_id: cont_type.id)
    
    dictionary = {:multibox => [music_type.id, cont_type.id]}
    @project = Project.search(dictionary)
    expect(@project.first).to eq(project_1)
  end

  it 'it will return all projects if contribution and project type do not exist' do
    music_type = Type.create(TypeName: 'random_type')
    podcast_type = Type.create(TypeName: 'second_random_type')
    video_type = Type.create(TypeName: 'wassup')

    cont_type = Contribution.create(ContributionType: 'random_type')
    second_cont_type = Contribution.create(ContributionType: 'second random_type')
    random_cont_type = Contribution.create(ContributionType: 'really random_type')
    

    project_1 = Project.create( ProjectName: 'founder', 
                                ProjectLink: 'fake link', 
                                ProjectOwner: 'Atikan', 
                                ProjectStart: "2022-03-03",
                                ProjectEnd: "2022-03-03",
                                TypeID: music_type.id)
    project_2 = Project.create( ProjectName: 'not founder', 
                                ProjectLink: 'fake link', 
                                ProjectOwner: 'Alex', 
                                TypeID: podcast_type.id)

    display_one = DisplayLine.create( Project_id: project_1.id,
                                      Contribution_id: cont_type.id)
    
    dictionary = {:multibox => [video_type.id, random_cont_type.id]}
    @project = Project.search(dictionary)
    expect(@project.length).to eq(2)
  end

end

RSpec.describe DisplayLine, type: :model do
    subject do
      described_class.new(ComponentContributed: 'a', ComponentStartDate: Date.current, 
        ComponentEndDate: Date.current, 
        Project: Project.new(ProjectName: 'a', ProjectLink: 'b', TypeID: '1'), 
        Contribution: Contribution.new(ContributionType: 'Mixed'))
    end
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  
   
    it 'is not valid without a component start date' do
      subject.ComponentStartDate = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a component end date' do
      subject.ComponentEndDate = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a contribution project' do
      subject.Project = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a contribution type' do
      subject.Contribution = nil
      expect(subject).not_to be_valid
    end
  end

RSpec.describe Award, type: :model do
  subject do
    described_class.new(AwardName: 'Test Award', AwardLink: 'award.com', AwardYear: '2022-02-14')
  end

  it 'is valid with valid attributes' do
    expect(subject).to(be_valid)
  end

  it 'is not valid without a name' do
    subject.AwardName = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a year' do
    subject.AwardYear = nil
    expect(subject).not_to(be_valid)
  end

  it 'is valid with a name' do
    expect(subject).to(be_valid)
  end

  it 'is valid with a year' do
    expect(subject).to(be_valid)
  end
end
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
  end

RSpec.describe DisplayLine, type: :model do
    subject do
      described_class.new(ComponentContributed: 'a', ComponentStartDate: Date.current, ComponentEndDate: Date.current, ContribProject: 1, ContribType: 2)
    end
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  
    it 'is not valid without a component contributed' do
      subject.ComponentContributed = nil
      expect(subject).not_to be_valid
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
      subject.ContribProject = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a contribution type' do
      subject.ContribType = nil
      expect(subject).not_to be_valid
    end
  end
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
  
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
  
RSpec.describe Award, type: :model do
  subject do
    described_class.new(AwardName: 'Test Award', AwardLink: 'award.com', AwardYear: '2022-02-14')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.AwardName = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a year' do
    subject.AwardYear = nil
    expect(subject).not_to be_valid
  end

  it 'is valid with a name' do
    subject.AwardName = 'Test Award'
    expect(subject).to be_valid
  end

  it 'is valid with a year' do
    subject.AwardYear = '2022-02-14'
    expect(subject).to be_valid
  end

end
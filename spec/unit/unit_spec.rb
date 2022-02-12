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
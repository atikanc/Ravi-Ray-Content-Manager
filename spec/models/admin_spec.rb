require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject do
    described_class.new(email: 'mockemail@email.com', full_name: 'Test Name', uid: '123456789', avatar_url: 'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a full name' do
    subject.full_name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end
end

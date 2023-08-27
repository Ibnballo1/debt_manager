require 'rails_helper'

RSpec.describe User, type: :model do
  subject {User.new(name: 'Abdullateef', email: 'user1@gmail.com', password: '123456')}

  before { subject.save }

  it 'should not be valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'should not be valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(3) }
end
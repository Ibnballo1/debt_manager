require 'rails_helper'

RSpec.describe User, type: :model do
#   subject {User.new(name: 'Abdullateef', email: 'user1@gmail.com', password: '123456')}

#   before { subject.save }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(3) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end
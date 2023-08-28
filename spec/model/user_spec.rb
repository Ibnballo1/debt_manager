require 'rails_helper'

# RSpec.describe User, type: :model do
#   subject {User.new(name: 'Abdullateef', email: 'user1@gmail.com', password: '123456')}

#   before { subject.save }

#   it 'should not be valid without a name' do
#     subject.name = nil
#     expect(subject).to_not be_valid
#   end
#   it 'should not be valid without an email' do
#     subject.email = nil
#     expect(subject).to_not be_valid
#   end
#   it { should validate_presence_of(:name) }
#   it { should validate_length_of(:name).is_at_least(3) }
# end

RSpec.describe User, type: :model do
  let(:user) { User.new }

  it "is not valid without a name" do
    user.email = "test@example.com"
    user.password = "password123"
    expect(user).to_not be_valid
  end

  it "is not valid with a short name" do
    user.name = "Jo"
    user.email = "test@example.com"
    user.password = "password123"
    expect(user).to_not be_valid
  end

  it "is not valid with a long name" do
    user.name = "a" * 51
    user.email = "test@example.com"
    user.password = "password123"
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user.name = "John Doe"
    user.password = "password123"
    expect(user).to_not be_valid
  end

  it "is not valid with an invalid email format" do
    user.name = "John Doe"
    user.email = "invalid-email"
    user.password = "password123"
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    user.name = "John Doe"
    user.email = "test@example.com"
    expect(user).to_not be_valid
  end

  it "is not valid with a short password" do
    user.name = "John Doe"
    user.email = "test@example.com"
    user.password = "12345"
    expect(user).to_not be_valid
  end

  it "is valid with all valid attributes" do
    user.name = "John Doe"
    user.email = "test@example.com"
    user.password = "password123"
    expect(user).to be_valid
  end

  it "is not valid with a duplicate email" do
    # Create a user with a duplicate email
    existing_user = User.create(
      name: "Existing User",
      email: "test@example.com",
      password: "password123"
    )

    user.name = "John Doe"
    user.email = "test@example.com"
    user.password = "password123"
    
    expect(user).to_not be_valid
  end
end

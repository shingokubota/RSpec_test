require 'rails_helper'

# RSpec.describe User do
#   # 有効なファクトリを持つこと
#   it "has a valid factory" do
#     expect(FactoryBot.build(:user)).to be_valid
#   end
# end

RSpec.describe User do

  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  # # 有効なファクトリを持つこと
  # it "has a valid factory" do
  #   expect(FactoryBot.build(:user)).to be_valid
  # end
  
  # # 名がなければ無効な状態であること
  # it "is invalid without a first name" do
  #   user = FactoryBot.build(:user, first_name: nil)
  #   user.valid?
  #   expect(user.errors[:first_name]).to include("can't be blank")
  # end

  # # 姓がなければ無効な状態であること
  # it "is invalid without a last name" do
  #   user = FactoryBot.build(:user, last_name: nil)
  #   user.valid?
  #   expect(user.errors[:last_name]).to include("can't be blank")
  # end

  # # メールアドレスがなければ無効な状態であること
  # it "is invalid without a email address" do
  #   user = FactoryBot.build(:user, email: nil)
  #   user.valid?
  #   expect(user.errors[:email]).to include("can't be blank")
  # end

  # # 重複したメールアドレスなら無効な状態であること
  # it "is invalid with a duplicate email address" do
  #   User.create(
  #     first_name: "Joe",
  #     last_name:  "Tester",
  #     email:      "tester@example.com",
  #     password:   "foobar"
  #   )
  #   user = User.new(
  #     first_name: "Jane",
  #     last_name:   "Tester",
  #     email:        "tester@example.com",
  #     password:     "foobar"
  #   )
  #   user.valid?
  #   expect(user.errors[:email]).to include("has already been taken")
  # end

  # フルネームにするクラスメソッドが正常であること
  it "returns a user's full name as a string" do
    user = FactoryBot.build(:user, first_name: "John", last_name: "Doe")
    expect(user.name).to eq "John Doe"
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email:"aaron@example.com")
    user = FactoryBot.build(:user, email: "aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  # 複数のユーザで何かする
  it "does something with multiple users" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    expect(true).to be_truthy
  end
end

require 'spec_helper'

describe User do
  it "should successfully create 3 user" do
    3.times do
      FactoryGirl.create(:user)
    end
    expect(User.all).to have(3).items
  end

  it "should delete user" do
    FactoryGirl.create(:user)
    User.last.delete
    expect(User).to have(0).record
  end

  context 'delegates' do
    let(:user) { FactoryGirl.create(:user) }

    it "should have method first_name" do
      expect(user.role_name).to be_present
    end
  end

  context 'validation' do
    it { should validate_uniqueness_of(:email) }
  end
end

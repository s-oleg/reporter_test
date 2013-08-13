require 'spec_helper'

describe ReportsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:report) { FactoryGirl.create(:report) }

  before(:each) do
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(true)
  end

  describe '#index' do
    it '' do
    end
  end
end

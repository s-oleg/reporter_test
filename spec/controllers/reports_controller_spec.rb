require 'spec_helper'

describe ReportsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:report) { FactoryGirl.create(:report) }

  before(:each) do
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(true)
  end

  describe '#index' do
    before { get :index }

    it { expect(response).to render_template('index') }
    it { expect(assigns(:reports)).to_not be_nil }
  end

  describe '#show' do
    before { get :show, id: report }

    it { expect(response).to render_template('show') }
    it { expect(assigns(:report)).to_not be_nil }
    it { expect(assigns(:report)).to be_kind_of(Report) }
    it { expect(assigns(:report)).to eq(report) }
  end

  describe '#new' do
    before { get :new }

    it { expect(response).to render_template('new') }
    it { expect(assigns(:report)).to_not be_nil }
    it { expect(assigns(:report)).to be_kind_of(Report) }
  end

  describe '#create' do
    context 'with invalid attributes' do
      let(:invalid_attributes) { FactoryGirl.attributes_for(:report, description: '', height: '', width: '') }

      it 'should not save report' do
        expect{ post :create, report: invalid_attributes }.to_not change(Report, :count)
      end

      it 'should render to new' do
        post :create, report: invalid_attributes
        response.should render_template('new')
      end
    end

    context 'with valid attributes' do
      let(:valid_attributes) { FactoryGirl.attributes_for(:report) }

      it 'should save report' do
        expect{ post :create, report: valid_attributes }.to change(Report, :count).by(1)
      end

      it 'should render to report_path' do
        post :create, report: valid_attributes
        response.should redirect_to(Report.last)
      end
    end
  end

end

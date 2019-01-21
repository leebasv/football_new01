require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user_one) {FactoryBot.create(:user)}

  describe "GET #show/:id" do
    it "should render show user" do
      get :show, params: { id: user_one.id }
      expect(response).to be_successful
    end
  end
end

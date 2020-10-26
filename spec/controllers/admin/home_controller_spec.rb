require "rails_helper"

describe Admin::HomeController, type: :controller do
  describe "GET #index" do
    context "when user is not logged in" do
      it "should redirect to sign in url" do
        get :index
        expect(response.location).to eq("http://test.host/users/sign_in")
      end
    end

    context "when non-admin user is logged in" do
      let(:user) { create(:user) }

      it "should redirect to root url" do
        sign_in user
        get :index
        expect(response.location).to eq("http://test.host/")
      end

      it "should have error flash message" do
        sign_in user
        get :index
        expect(flash[:danger]).to eq(I18n.t("unauthorized_access"))
      end
    end

    context "when admin user is logged in" do
      let(:admin_user) { create(:admin_user) }

      it "should return success status code" do
        sign_in admin_user
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end

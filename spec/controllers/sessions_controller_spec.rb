require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "Authentication" do
    # Runs the test omniauth to create mock user with data
    before do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:fiveHundredPx]
    end

    # Checks that a user is created
    it "should successfully create a user" do
      expect {post :create, params: {provider: '500px'}}.to change{ User.count }.by(1)
    end

    # Checks that a session is created
    it "should successfully create a session" do
      expect(session[:user_id]).to be_nil
      post :create, params: {provider: :fiveHundredPx}
      expect(session[:user_id]).to_not be_nil
    end

    # Checks to see if user is redirected to root after signing in
    it "should redirect the user to the root url" do
      post :create, params: {provider: :fiveHundredPx}
      expect(response).to redirect_to(root_url)
    end

  end

  describe "#destroy" do
    before do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:fiveHundredPx]
    end

    # Checks if a session exists before sign in and after sign out
    it "should clear the session" do
      post :create, params: {provider: :fiveHundredPx}
      expect(session[:user_id]).to_not be_nil
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    # Checks if user is redirected to root after signing out
    it "should redirect to the home page" do
      delete :destroy
      expect(response).to redirect_to(root_url)
    end
  end
end

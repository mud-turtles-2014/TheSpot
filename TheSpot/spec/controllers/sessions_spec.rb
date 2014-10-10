require 'rails_helper'

describe SessionsController do
  let(:user){User.find(1)}
  describe "new" do
    it "renders the new template" do
      get :new
      response.should render_template :new
    end
  end
  # describe "create" do
  #   it "creates a new session for a valid user" do
  #   expect  post :create, session: {username: user.username, password: user.password}


  #   end



end

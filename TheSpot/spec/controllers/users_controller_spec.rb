require 'spec_helper'
require 'rails_helper'

describe UsersController do
  describe "#new" do
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_an_instance_of User
    end
    it "renders the #new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new user to the database" do
        expect {
          post :create, user: {username: "polly123", email: "polly@gmail.com", password: "password", password: "password"}
        }.to change(User, :count).by(1)
      end
      it "redirects to the login page" do
      	post :create, user: {username: "polly123", email: "polly@gmail.com", password: "password", password: "password"}
      	expect(response).to redirect_to '/login'
      end
    end

    context "with invalid attributes" do
      it "does not save the new user to the database"
      it "redirects to the #new page" do 
      	post :create, user: {username: "mollypolly", email: nil, password: "password", password_confimation: "password"}
        expect(response).to redirect_to new_user_path
      end
      it "assigns a flash to notify user of error"
    end
  end

  describe "#edit" do
    it "assigns the user to @user" do
      user = User.create!(username:"polly123", email:"polly@gmail.com",password:"password", password_confirmation: "password")
      get :edit, id: user
      expect(assigns(:user)).to eq user
    end
    it "renders the :edit template" do 
		user = User.create!(username:"polly123", email:"polly@gmail.com",password:"password", password_confirmation: "password")
      get :edit, id: user
      expect(response).to render_template :edit
    end
  end

  describe "#update" do 
  	context "with valid attributes" do 
  	  it "updates the database" do 
		user = User.create!(username:"polly123", email:"polly@gmail.com",password:"password", password_confirmation: "password")
        new_email = "molly@gmail.com"
        put :update, id: user, user: {email: new_email}
        user.reload
        expect(user.email).to eq(new_email)
  	  end
  	  it "redirects the user#show" do
  	  	user = User.create!(username:"polly123", email:"polly@gmail.com",password:"password", password_confirmation: "password")
        new_email = "molly@gmail.com"
        put :update, id: user, user: {email: new_email}
        user.reload
        expect(response).to redirect_to user_path(assigns[:user])
  	  end
  	end

  	context "with invalid attributes" do 
  	  it "does not update the database"
  	  it "redirects to user#edit" do
        user = User.create!(username:"polly123", email:"polly@gmail.com",password:"password", password_confirmation: "password")
        new_email = "@gmail.com"
        new_username = ""
        put :update, id: user, user: {email: new_email, username: new_username}
        expect(response).to redirect_to edit_user_path(assigns[:user])
      end
  	end
  end
end
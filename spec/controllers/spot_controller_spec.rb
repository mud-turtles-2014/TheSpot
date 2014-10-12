require 'spec_helper'
require 'rails_helper'

describe SpotsController do
  describe "#index" do
    it "assigns all spots to @spots" do
      get :index
      expect(assigns(:spots)).to eq Spot.all.order(:favorites_count)
    end
    it "renders the #index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "#new" do
    it "assigns a new spot to @spot" do
      get :new
      expect(assigns(:spot)).to be_an_instance_of Spot
    end
    it "renders the #new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new spot to the database" do
       expect{
          post :create, spot: {name: "Cookie's Cookies", address: "48 Wall Street New York NY 10003", phone: "212-456-1234", price: 4}
        }.to change(Spot, :count).by(1)
      end
      it "redirects to the #show page" do
        post :create, spot: {name: "Cookie's Cookies", address: "48 Wall Street New York NY 10003", phone: "212-456-1234", price: 4}
        spot = Spot.last
        expect(response).to redirect_to spot_path(assigns[:spot])
      end
    end


    context "with invalid attributes" do
      it "does not save the new spot to the database"
      it "redirects to the #new page"
      it "assigns a flash to notify user of error"
    end
  end

  describe "#show" do
    it "assigns the spot to @spot" do
      user = User.create!(username:"polly123", email:"polly@gmail.com",password:"password", password_confirmation: "password")
      spot = Spot.create!(name:"Sarah's Bakery", address:"100 Fifth Avenue New York, NY 10003", phone:"212-555-555", price: 2)
      get :show, id: spot
      expect(assigns(:spot)).to eq spot
    end
    it "renders the show template" do
      user = User.create!(username:"polly123", email:"polly@gmail.com",password:"password", password_confirmation: "password")
      spot = Spot.create!(name:"Sarah's Bakery", address:"100 Fifth Avenue New York, NY 10003", phone:"212-555-555", price: 2)
      get :show, id: spot
      expect(response).to render_template :show
    end
  end

  describe "#edit" do
    it "assigns the spot to @spot" do
      spot = Spot.create!(name:"Rafael's Bakery", address:"100 Ninth Avenue New York, NY 10013", phone:"212-999-9555", price: 4)
      get :edit, id: spot
      expect(assigns(:spot)).to eq spot
    end
    it "renders the :edit template" do
      spot = Spot.create!(name:"Rafael's Bakery", address:"100 Ninth Avenue New York, NY 10013", phone:"212-999-9555", price: 4)
      get :edit, id: spot
      expect(response).to render_template :edit
    end
  end

  describe "#update" do
  	context "with valid attributes" do
  	  it "updates the database" do
        spot = Spot.create!(name:"Rafael's Bakery", address:"100 Ninth Avenue New York, NY 10013", phone:"212-999-9555", price: 4)
        new_name = "Rafa's"
        put :update, id: spot, spot: {name: new_name}
        spot.reload
        expect(spot.name).to eq(new_name)
      end
  	  it "redirects to spot#show" do
        spot = Spot.create!(name:"Rafael's Bakery", address:"100 Ninth Avenue New York, NY 10013", phone:"212-999-9555", price: 4)
        new_name = "Rafa's"
        put :update, id: spot, spot: {name: new_name}
        expect(response).to redirect_to spot_path(assigns[:spot])
      end
  	end

  	context "with invalid attributes" do
  	  it "does not update the database"
  	  it "redirects to spot#edit"
  	end
  end

  describe "#destroy" do
    it "deletes the spot from the database" do
      spot = Spot.create!(name:"Rafael's Bakery", address:"100 Ninth Avenue New York, NY 10013", phone:"212-999-9555", price: 4)
      delete :destroy, id: spot
      expect(Spot.all).to_not include spot
    end
    it "redirects to spot index" do
      spot = Spot.create!(name:"Rafael's Bakery", address:"100 Ninth Avenue New York, NY 10013", phone:"212-999-9555", price: 4)
      delete :destroy, id: spot
      expect(response).to redirect_to spots_path
    end
  end
end
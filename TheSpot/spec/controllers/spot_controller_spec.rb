require 'spec_helper'
require 'rails_helper'

describe SpotsController do
  describe "#index" do
    it "assigns all spots to @spots" do
      get :index
      expect(assigns(:spots)).to eq Spot.all
    end
    it "renders the #index template" do
      get :index
      expect(response).to render_template :index
  end

  describe "#new" do
    it "assigns a new spot to @spot"
    it "renders the #new template"
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new spot to the database"
      it "redirects to the #show page"
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
      expect(response).to render_template spot_path(assigns[:spot])
    end
  end

  describe "#edit" do
    it "assigns the spot to @spot"
    it "renders the :edit template"
    end
  end

  describe "#update" do 
  	context "with valid attributes" do 
  	  it "updates the database"
  	  it "redirects to spot#show"
  	end

  	context "with invalid attributes" do 
  	  it "does not update the database"
  	  it "redirects to spot#edit"
  	end
  end

  describe "#destroy" do 
    it "deletes the spot from the database"
    it "redirects to spot index"
  end
end
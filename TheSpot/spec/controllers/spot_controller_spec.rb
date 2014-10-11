require 'spec_helper'
require 'rails_helper'

describe SpotsController do
  describe "#index" do
    it "assigns all spots to @spots"
    it "renders the #index template"
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
    it "assigns the spot to @spot"
    it "renders the show template"
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
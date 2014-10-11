require 'spec_helper'
require 'rails_helper'

describe UsersController do
  describe "#new" do
    it "assigns a new user to @user"
    it "renders the #new template"
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new user to the database"
      it "redirects to the login page"
    end

    context "with invalid attributes" do
      it "does not save the new user to the database"
      it "redirects to the #new page"
      it "assigns a flash to notify user of error"
    end
  end
end
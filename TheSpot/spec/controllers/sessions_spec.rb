require 'rails_helper'

describe SessionsController do
  describe "new" do
    it "renders the new template" do
      get :new
      response.should render_template :new
    end
  end

end

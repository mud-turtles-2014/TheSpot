class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def yelp_search
    response = @yelp_client.search('New York City', category_filter: breakfast_brunch)
  end
end

class Spot < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :favorites

  def is_favorited_by(user)
  	self.favorites.include?(user.favorite)
  end

  def call_api_search
    @spots = []
    response = Yelp.client.search('New York City', category_filter: 'breakfast_brunch', term: params[:q])
    response.businesses.each do |biz|
        @spots << Spot.where(name: biz.name, address: biz.location.display_address.join(", "), phone: biz.phone, website: biz.url, photo: biz.image_url.gsub!(/ms.jpg/, 'ls.jpg')).first_or_create
      end
    redirect_to spots_path
  end

  def call_api_create
    response = Yelp.client.search('New York City', category_filter: 'breakfast_brunch', term: params[:spot][:name], limit: 1)
      if response.businesses.length == 1
        @yelp_spot = Spot.find_by(name: response.businesses.first.name)
          if @yelp_spot
            redirect_to spot_path(@yelp_spot)
          end
      else
        @new_spot = Spot.new(spot_params)
        @new_spot.assign_attributes(user: current_user)
         if @new_spot.save
          redirect_to spot_path(@new_spot)
         else
          redirect_to new_spot_path
        end
      end
  end

end

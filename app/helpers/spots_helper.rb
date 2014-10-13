module SpotsHelper
  def show_photo(url)
  	("<div class='spot-photo'><img src='" + url + "'/></div>").html_safe
  end

  def show_price(count)
  	string = ""
  	count.times { string += "$"}
  	string.html_safe
  end
end

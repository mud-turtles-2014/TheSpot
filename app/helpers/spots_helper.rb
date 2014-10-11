module SpotsHelper
  def show_photo(url)
  	("<img src='" + url + "'/>").html_safe
  end

  def show_price(count)
  	string = ""
  	count.times { string += "$"}
  	string.html_safe
  end
end

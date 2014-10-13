module SpotsHelper
  def show_photo(url)
  	("<img src='" + url + "' class='spot-photo'/>").html_safe
  end

  def show_price(count)
  	string = ""
  	count.times { string += "$"}
  	string.html_safe
  end

  def format_phone(phone)
  	if phone.length == 9
  	  "212-123-1234".html_safe
  	end
  end
end

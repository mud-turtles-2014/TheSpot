module SpotsHelper

  def show_price(count)
  	string = ""
  	count.times { string += "$"}
  	string.html_safe
  end

  def favorites(count)
  	if count == 0
  	  return "No favorties yet"
  	elsif count == 1
  	  return "Favorited 1 time"
  	else
  	  return "Favorited #{count} times"
  	end
  end
end

class VisitorsController < ApplicationController

  def login
    session["email"] = params["user"]["email"]
    location_rating = LocationRating.where(rating:nil).first
    if location_rating  
      redirect_to edit_location_rating_path(location_rating)
    else
      redirect_to location_ratings_path
    end
  end

end

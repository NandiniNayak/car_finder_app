class HomeController < ApplicationController
  def page
    @listings = Listing.all
  end
end

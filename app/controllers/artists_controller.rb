class ArtistsController < ApplicationController
  get '/artists' do # route is GET request to localhost:9393/artists to display all artists
    @all_artists = Artist.all
    # store array of all artist instances in @all_artists instance variable to pass to view file
    erb :'artists/index' # render the index.erb view file that is within the artists/ subfolder within views/ folder
  end
  # show action below to display info about a single artist:
  get '/artists/:slug' do # route is GET request to localhost:9393/artists/slugified-version-of-@name-attribute-value-of-artist-instance-goes-here
    @artist = Artist.find_by_slug(params[:slug]) # artist instance stored in @artist instance variable to pass to view
      # :slug is key in params hash because it's a route variable
      # route variable :slug is replaced by params[:slug] = slugified version of @name attribute value of artist instance, which is returned by calling #slug instance method on artist instance
    erb :'artists/show' # render the show.erb view file, which is found in artists/ subfolder within views/ folder
  end
end

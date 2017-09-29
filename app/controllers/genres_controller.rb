class GenresController < ApplicationController
  get '/genres' do # route is GET request to localhost:9393/genres to display all genres
    @all_genres = Genre.all
    # store array of all genre instances in @all_genres instance variable to pass to view file
    erb :'genres/index' # render the index.erb view file that is within the genres/ subfolder within views/ folder
  end
  # show action below to display info about a single genre:
  get '/genres/:slug' do # route is GET request to localhost:9393/genres/slugified-version-of-@name-attribute-value-of-genre-instance-goes-here
    @genre = Genre.find_by_slug(params[:slug]) # genre instance stored in @genre instance variable to pass to view
    # :slug is key in params hash because it's a route variable
    # route variable :slug is replaced by params[:slug] = slugified version of @name attribute value of genre instance, which is returned by calling #slug instance method on genre instance
    erb :'genres/show' # render the show.erb view file, which is found in genres/ subfolder within views/ folder
  end
end

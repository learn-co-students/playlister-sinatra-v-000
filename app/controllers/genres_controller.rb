class GenresController < ApplicationController

  get '/genres' do
    # This should present the user with a list of all genres in the library.
    # Each genre should be a clickable link to that particular genre's show page.
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    # Any given genre's show page should have links to each of its artists and songs.
    erb :'genres/show'
  end

end

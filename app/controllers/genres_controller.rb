class GenresController < ApplicationController

  get '/genres' do
    # Present the user with a list of genres in the library
    # Each genre should be a clickable link to that particular genre's show page
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    # Any given genre's show page should have links to that genre's artists and songs.
    erb :'/genres/show'
  end

end
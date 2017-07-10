class GenresController < ApplicationController
    
    # present the user with a list of all genres 
    # Each genre should be a clickable link to genre's show page.

    get '/genres' do

    erb :index
    end

    # Any given genre's show page with links to genre's artists and songs.
    get '/genres/:slug' do

        erb :show
    end

end
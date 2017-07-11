class GenresController < ApplicationController
    
    # present the user with a list of all genres 
    # Each genre should be a clickable link to genre's show page.

    get '/genres' do
        @genres = Genre.all
    erb :"/genres/index"
    end

    # Any given genre's show page with links to genre's artists and songs.
    get '/genres/:slug' do

        erb :"/genres/show"
    end

end
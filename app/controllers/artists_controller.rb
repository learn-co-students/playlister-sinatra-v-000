class ArtistsController < ApplicationController

  get '/artists' do
      erb :artist_list
    end


    get '/artists/:slug' do
      @artist = Artist.find_by_slug(params[:slug])
      erb :show_artist
    end

end

class ArtistsController < ApplicationController


      get '/artists' do
        # binding.pry
        @artists = Artist.all
        erb :'artists/index'
      end

      get '/artists/:slug' do
        binding.pry
        @artist = Artist.find_by(name: params[:slug])
      end

end

class ArtistsController < ApplicationController


      get '/artists' do
        # binding.pry
        @artists = Artist.all
        erb :'artists/index'
      end

      get '/artists/:slug' do
        slug = params[:slug]
        @artist = Artist.find_by_slug(slug)
      end

end

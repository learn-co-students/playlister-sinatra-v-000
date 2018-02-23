require './app/models/concerns/slugifiable'

class ArtistsController < ApplicationController
  include Slugifiable

 get '/artists' do
   @artists = Artist.all
   erb :"/artists/index"
 end

 get '/artists/:slug' do
   @artist = Artist.find_by_slug(params[:slug])

   erb :"artists/show"
 end

end

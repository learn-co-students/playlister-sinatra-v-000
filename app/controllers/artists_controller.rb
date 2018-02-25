<<<<<<< HEAD
class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :"/artists/index"
  end

  get '/artists/:slug' do
    # binding.pry
    @artist = Artist.find_by_slug(params[:slug])
    erb :"/artists/show"
  end
=======
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
>>>>>>> 1f9fad4566e7bea66933d1080285aea037651e86

end

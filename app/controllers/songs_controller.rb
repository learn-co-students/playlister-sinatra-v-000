class SongsController < ApplicationController

    get '/songs' do
      erb :index
    end 
 
#  get '/songs/:slug' do
   # @song = Song.find_by_slug(params[:name])
   #  erb :index
#  end

end

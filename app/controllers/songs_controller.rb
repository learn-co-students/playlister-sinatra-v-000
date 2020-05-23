require 'rack-flash'

class SongsController < ApplicationController
   enable :sessions
   use Rack::Flash
   
    get '/songs' do
       @songs = Song.all
      erb :"/songs/index"
    end 
 
    get '/songs/new' do
      @songs= Song.all
      erb :"/songs/new"
   end

   post '/songs' do
      if !Artist.find_by_name(params[:artist][:name])
      @artist = Artist.create(params[:artist])
      end
      @song = Song.create(params[:song])
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      if params[:genres] != nil
            params[:genres].each do |id|
            @song.genres << Genre.find(id)
            end
         end
      @song.save
      flash[:message] = "Successfully created song."
      redirect to ("/songs/#{@song.slug}")
   end

   get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      erb :"/songs/show"
   end

   get '/songs/:slug/edit' do 
      @song = Song.find_by_slug(params[:slug])
      # @songs = Song.all
       erb :"/songs/edit"

   end

   patch '/songs/:slug/edit' do 
      if !Artist.find_by_name(params[:artist][:name])
         @artist = Artist.update(params[:artist])
         end
         # @song = Song.create(params[:song])
         # @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
         # if params[:genres] != nil
         #       params[:genres].each do |id|
         #       @song.genres << Genre.find(id)
         #       end
         #    end
         @song.save
         # flash[:message] = "Successfully created song."
         redirect to ("/songs/#{@song.slug}")


      # erb :"/songs/edit"
   end

end

require 'rack-flash'

class SongsController < ApplicationController
   use Rack::Flash #for messages

   get '/songs' do
    @songs=   Song.all
    erb :'songs/index'
   end

   get '/songs/new' do
        @genres= Genre.all
        erb :'songs/new'
   end



#solution
  #  post '/songs' do
  #    @song = Song.create(params[:song])
  #    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
  #    @song.genre_ids = params[:genres]
  #    @song.save
   #
  #    flash[:message] = "Successfully created song."
  #    redirect("/songs/#{@song.slug}")
  #  end

   #
   post '/songs' do
          # binding.pry
          @song = Song.create(params[:song])  #same params[:song][:name]

                  if !(!Artist.find_by(name: params[:artist][:name]))
                      @song.artist = Artist.find_by(name: params[:artist][:name])
                  else
                      @song.artist = Artist.create(params[:artist])
                  end
          # @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
          @song.genre_ids = params[:genre]  #array
          @song.save

          flash[:message] = "Successfully updated song."
          redirect  "/songs/#{@song.slug}"
   end


   get '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])
    #  binding.pry
     erb :'songs/show'
   end

end

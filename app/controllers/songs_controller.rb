require 'pry'
require 'rack-flash'


class SongsController < ApplicationController
  use Rack::Flash
  configure do
  enable :sessions
  set :session_secret, "secret"

end


     get '/songs' do
      @songs = Song.all
      # model name followed by a method
      erb :'/songs/index'
    end

    get '/songs/new' do
       @genres = Genre.all
       @artists = Artist.all
      erb :'/songs/new'
    end


   post '/songs' do
 #create a new artist
 #need a flash message...

        @song = Song.create(name: params[:Name])   # This is where we set the name for song/ it want us to pass in an hash.
        @song.artist = Artist.find_or_create_by(name: params["Artist Name"])

        @song.genre_ids = params["genres"]
        @song.save
       flash[:message] = "Successfully created song."

      redirect to ("/songs/#{@song.slug}")  # "/songs/that-one-with-the-guitar"
  end


    get '/songs/:slug' do
         @song = Song.find_by_slug(params[:slug])  # slug helps to find by name instaed of ID
         # model name followed by a method
         erb :'/songs/show'
    end


    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])  # slug helps to find by name instaed of ID
        erb :'songs/edit'
    end

        #update the form

      patch '/songs/:slug' do
          @song = Song.find_by_slug(params[:slug])
          @song.update(params[:song])

          @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
# May need or not need
          #  if !params["Artist Name"].empty?
          @song.genre_ids = params[:genres]

           @song.save

           flash[:message] = "Successfully created song."
          redirect to("/songs/#{@song.slug}")

            # end

        end

end #end for class method

class SongsController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


    get '/songs' do
      @songs = Song.all
      erb :'songs/index'
    end

    get '/songs/new' do
      # @song = Song.create(params)
      # @artists = Artist.all
      @genres = Genre.all
      erb :'/songs/new'
    end

    get '/songs/:slug' do
      # binding.pry
      slug = params[:slug]
      @song = Song.find_by_slug(slug)
      @genres = Genre.all
      erb :'songs/show'
    end


    post '/songs' do

      # @genres = Genre.all

      @song = Song.create(name: params[:song][:name]) #create a new song using the name entered

      if params[:song][:artist]  #if the user entered a name for the artist
        @artist = Artist.all.find_by(name: params[:song][:artist][:name]) #look for that artist in our Artist class by name and set to a variable @artist
          if @artist == nil #if no artist was found
            @artist = Artist.create(params[:song][:artist]) #create a new artist using the name entered CHECK THIS PARAMS HASH and set to instance variable @artist
            @song.artist_id = @artist.id #associate the song and the new artist
            @song.save #save the association
          else #if an artist WAS found
            @song.artist_id = @artist.id #associate the song to the artist
          end
      else #if the user didn't enter a name for the artist
        @song = Song.create(name: params[:song][:name]) #create and save a new song with no artist
      end

      @genre = @genres.find_by(id: params[:song][:genres])
      @song.genres << @genre

      redirect "/songs/#{@song.slug}"
    end


end

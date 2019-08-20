require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash
  
  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
    # This helped with the syntax above: https://stackoverflow.com/questions/2129504/sinatra-sub-directory-views
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :"songs/new"
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  post '/songs' do
    # I'm doing this in a different way than in the Complex Forms Associations lab: 
    # Let the user choose an artist AND specify a new one, then make the artist depending on what the user did.
    # I'm not entirely sure that I'm doing this right; my params hash looks pretty weird.

    song = Song.create(params[:song])

    if !params[:artist_name].blank? # The user created a new (or existing) artist.
      song.artist = Artist.find_or_create_by(name: params[:artist_name])
    elsif params[:artist] # The user chose an existing artist.
      song.artist = Artist.find_or_create_by(params[:artist])
    else # The user didn't choose an artist or select an existing one.
      song.destroy
      redirect to "/error"
      # The code below doesn't work because the code outside of this "if" statement is ALSO executed:
      # flash[:error] = "You forgot to give your song an artist."
      # erb :error
    end
   
    song.save    
    flash[:message] = "Successfully created song."
    # See https://github.com/treeder/rack-flash#sinatra for how to use Rack Flash.
    # Note: I still need to see how to display flash.now messages.

    redirect to "/songs/#{song.slug}"

    #-----Earlier code, when certain params had different names-----
    # song = Song.new(name: params[:name])
    # song.genre_ids = params[:genres]
    # song.artist = Artist.create(name: params[:artist_name])
    # song.save
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists, @genres = Artist.all, Genre.all
    erb :"songs/edit"
  end

  patch '/songs/:slug' do
    # Update the song with a new name and/or artist and/or genre(s)
    # Things to account for (some of them being my own add-ons):
      # If the user chose another artist from the list
      # If the user made a new artist
        # If the user's new artist already exists
      # If the user chose another artist AND made a new artist
      # Which genres the user checked
      # Whether the user checked ANY genres
    #binding.pry

    song = Song.find_by_slug(params[:slug])

    # I need to structure my params hash better for the song's artist...
    if !params[:artist_name].blank? # The user created a new (or existing) artist.
      new_artist = Artist.find_or_create_by(name: params[:artist_name])
    else # The user chose another existing artist or left the song's artist unchanged.
      new_artist = Artist.find_or_create_by(params[:artist])
    end

    ####### Possible bug fix: set the genre_ids to [] if the genre_ids are nil. ########

    song.update(name: params[:song][:name], artist: new_artist)

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{song.slug}"   
  end
  
end

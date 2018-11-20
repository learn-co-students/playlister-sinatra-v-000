class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
      # Assigns the artist
      artist_name = params[:artist][:name]
      if Artist.find_by(name: artist_name)
        @artist = Artist.find_by(name: artist_name)
      else
        @artist = Artist.create(name: artist_name)
      end
      # Assigns the genres
      @song = Song.create(name: params[:songs][:name], artist: @artist)
        params[:genres].each do |genre|
          @song.genres << Genre.find(genre)
        end
      flash[:message] = "Successfully created song."
      redirect to("/songs/#{@song.slug}")
    end

    get '/songs/:slug' do
      @slug = Song.find_by_slug(params[:slug].gsub("-"," "))
      @artist = Artist.find(@slug.artist_id)
      erb :'songs/show'
    end

end

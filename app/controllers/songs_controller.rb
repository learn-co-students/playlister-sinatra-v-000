class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'songs/new'
  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    binding.pry
    erb :'/songs/show'
  end

  post '/songs' do
    # binding.pry
    @song = Song.create(:name => params[:name])
    params[:genres].each do |genre|
      genre = Genre.find(genre)
      @song.song_genres.build(:genre => genre).save
    end

    artist = Artist.find_or_create_by(:name => params[:artist_name])
    @song.artist = artist

    @song.save
    # binding.pry
    sluggy = @song.slug
    flash[:message] = "Successfully created song."
    redirect "/songs/#{sluggy}"
  end

end

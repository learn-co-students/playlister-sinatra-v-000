class SongsController < Sinatra::Base
set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
  @song = Song.new(name: params[:name])
  params[:genres].each do |genre_id|
    @song.genres << Genre.find(genre_id)
  end
    if Artist.find_by_name(params[:artist_name])
      @song.artist = Artist.find_by_name(params[:artist_name])
    else
      @song.artist = Artist.create(name: params[:artist_name])
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end





end

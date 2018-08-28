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
    song = Song.create(name: params['Name'])
    binding.pry
    artist = Artist.find_by(name: params['Artist Name'])
    if artist.nil?
      artist = Artist.create(name: params['Artist Name'])
      artist.songs << song
    else
      song.artist = artist
    end
    
    if !params['Genre Name'].empty?
      genre = Genre.create(name: params['Genre Name'])
      song.genres << genre
      
    end
    genre_ids = params['genre_ids']
    binding.pry
    if genre_ids.nil?
    end
    
    redirect to "/songs/#{song.slug}"
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !@song.nil?
      @artist = Artist.find(@song.artist_id)
    end

    erb :'/songs/show'
  end
  
  post '/songs/:slug' do
    redirect to '/songs/show'
  end
  
  get '/songs/:slug/edit' do
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
  end
end
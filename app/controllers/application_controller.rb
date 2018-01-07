class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/genres' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'genres/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    if Artist.all.find_by(name: params[:artist][:name])
      @artist = Artist.all.find_by(name: params[:artist][:name])
    else
      @artist = Artist.create(name: params[:artist][:name])
    end
    @genre = Genre.all.find_by(name: params[:genre][:name])
    @song.artist_id = @artist.id
    @song.genre_ids = @genre.id
    @song.save
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.all.find { |song| song.slug == params[:slug] }
    @artist = Artist.all.find_by(id: @song.artist_id)
    @genre = Genre.all.find_by(id: @song.genre_ids[0])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.all.find_by(id: @song.artist_id)
    @genre = Genre.all.find_by(id: @song.genre_ids[0])
    if params[:song][:name] != ""
      @song.name = params[:song][:name]
    end
    if params[:artist][:name] != ""
      @artist.name = params[:artist][:name]
    end
    if params[:genre][:name] != ""
      @genre.name = params[:genre][:name]
    end
    @song.save
    binding.pry
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.all.find { |song| song.slug == params[:slug] }
    @artist = Artist.all.find_by(id: @song.artist_id)
    @genre = Genre.all.find_by(id: @song.genre_ids[0])
    erb :'songs/show'
  end

  get '/artists/:slug' do
    @artist = Artist.all.find { |artist| artist.slug == params[:slug] }
    erb :'artists/show'
  end

  get '/genres/:slug' do
    @genre = Genre.all.find { |genre| genre.slug == params[:slug] }
    erb :'genres/show'
  end
end

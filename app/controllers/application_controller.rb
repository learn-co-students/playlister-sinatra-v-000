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
    erb :'genres/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    @artist = Artist.create(name: params[:artist][:name])
    @genre = Genre.all.find_by(name: params[:genre][:name])
    @song.artist_id = @artist.id
    @song.genre_ids = @genre.id
    @song.save
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.all.find do |song|
              song.slug == params[:slug]
            end
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

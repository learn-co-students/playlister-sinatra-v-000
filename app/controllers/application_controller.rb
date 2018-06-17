class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @list = Song.all
    erb :'songs/index'
  end

  get '/genres' do
    @list = Genre.all
    erb :'genres/index'
  end

  get '/artists' do
    @list = Artist.all
    erb :'artists/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs/new' do
    @artist = Artist.find_by(name: params["Artist Name"]) || Artist.create(name: params["Artist Name"])
    @genre = Genre.find_by(params[:genre]) || Genre.create(name: params["Genre Name"])
    @song = Song.create(name: params["Name"])
    @song.genres << @genre
    @artist.songs << @song
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug/edit' do
    @artist = Artist.find_by(name: params["Artist Name"]) || Artist.create(name: params["Artist Name"])
    @genre = Genre.find_by(params[:genre]) || Genre.create(name: params["Genre Name"])
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: "#{params["Name"]}", artist_id: "#{@artist.id}", genre_ids: "#{@genre.id}")
    redirect "/songs/#{@song.slug}"
  end


  get '/songs/:slug' do
    @slug = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/genres/:slug' do
    @slug = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end

  get '/artists/:slug' do
    @slug = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end

end

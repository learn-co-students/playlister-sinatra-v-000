class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end



  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    redirect to("/songs/#{@song.slug}")
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


  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end




  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params["slug"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    if !@song.genres.include?(Genre.find(params["genres"][0].to_i))
      @song.genres << Genre.find(params["genres"][0].to_i)
    end
    @song.name = params["Song Name"]
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(:slug)
    @song.save
    erb :'songs/:slug'
  end



end

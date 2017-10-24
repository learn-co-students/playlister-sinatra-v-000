class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  get '/' do
    erb :index
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  #songs slugifiable
  get '/songs/:slug' do
    @songs = Song.find_by_slug(params["slug"])
    erb :'songs/show'
  end


  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do
    @song = Song.new(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genres = params[:genres].map {|genre| Genre.find_by(name: genre)}
    @song.save
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end



end

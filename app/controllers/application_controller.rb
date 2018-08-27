class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
  redirect '/songs'    
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  # get '/songs/:id' do 
  #   @song = Song.find_by(id: params[:id])
  #   erb :"songs/show"
  # end
    # post '/songs' do
  #   # binding.pry
  #   Song.create(name: params[:name], genre: params[:genre])
  #   redirect '/songs/index' 
  # end

  # get '/songs/:slug' do
  #   @song = Song.find_by_slug(slug: params[:slug])
  #   erb :'songs/show'
  # end

  # get '/posts/:id' do
  #   @post = Post.find(params[:id])
  #   erb :'posts/show'
  # end

  get '/artists' do 
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/genres' do 
    @genres = Genre.all
    erb :'/genres/index'
  end

  # post '/songs' do
  #   # binding.pry
  #   Song.create(name: params[:name], genre: params[:genre])
  #   redirect '/songs/index' 
  # end

  get '/genres' do
    erb :index
  end
end
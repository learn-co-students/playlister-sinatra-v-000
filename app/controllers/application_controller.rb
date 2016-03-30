require 'pry'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
  	@songs= Song.all
  	erb :"/songs/index"
  end

	get '/genres' do
  	@genres= Genre.all
  	erb :"/genres/index"
  end

  get '/artists' do
  	@artists= Artist.all
  	erb :"/artists/index"
  end

  get '/songs/new' do
    @genres= Genre.all
    erb :"/songs/new"
  end

  post '/songs' do
    
    @artist =Artist.find_or_create_by(name: params[:artist_name])
    @song = Song.create(name: params[:name])
    (@artist.songs << @song).uniq
    genres_index = params[:genres].first.to_i-1
    @song.genres << Genre.all[genres_index]
    @song.save
    
    
    erb  :'songs/show', locals: {message: "Successfully created song."}
  end

  get '/songs/:slug' do
  	@song= Song.find_by_slug(params[:slug])
  	erb :"/songs/show"
  end

  get '/artists/:slug' do
  	@artist= Artist.find_by_slug(params[:slug])
  	erb :"/artists/show"
  end

  get '/genres/:slug' do
  	@genre= Genre.find_by_slug(params[:slug])
  	erb :"/genres/show"
  end

  get '/songs/:slug/edit' do
    
    @genres= Genre.all
    @song=Song.find_by_slug(params[:slug])
    @checked = @genres.map do |genre|
      @song.genres.include?(genre)? "checked" : ""
    end
    
    erb :"/songs/edit"
  end

  patch '/songs/:slug' do
    puts params

    @song=Song.find_by_slug(params[:slug])

    if params[:artist_name]!=""
      
      @artist = Artist.find_or_create_by(name: params[:artist_name])
      @song.artist = @artist
      @artist.songs << @song
    end

    if params[:genres].size > 0
      @genres = params[:genres].map do |id|
        Genre.all[id.to_i-1]
      end
    end
    @song.genres = @genres
    erb :"songs/show", locals: {message: "Song successfully updated."}
  end




end
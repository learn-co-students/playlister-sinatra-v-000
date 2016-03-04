class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

 post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !params[:song][:name].empty?
      @song.update(name: params[:song][:name])
    end
    if !params[:song][:artist][:name].empty?
      artist = Artist.find_or_create_by(name: params[:song][:artist][:name])
      @song.update(artist: artist)
    end
    @song.save
    erb :"songs/#{@song.slug}", locals: {message: "Song successfully updated."}
  end

  post '/songs' do
    @song = Song.new(name: params[:name]) 
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    @song.save
    erb :"songs/#{@song.slug}", locals: {message: "Successfully created song."}
  end

 
end
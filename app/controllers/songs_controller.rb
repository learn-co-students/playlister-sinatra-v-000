class SongsController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do
    erb :"/songs/new"
  end

  post '/songs' do
    #create new song and set to song instance
    @song = Song.create(name: params[:name])

    #find artist by name via slugifeidname, if not, create new artist and set to artist instance variable
    @artist = Artist.find_by_slug(params[:artist_name])
    @artist ||= Artist.create(name: params[:artist_name])

    #set each genre to belong to the song
    params[:genres].each do |genre_id|
      genre = Genre.find_by_id(genre_id)
      @song.genres << genre
    end

    #set song to belong to artist
    @artist.songs << @song
    @artist.save

    #set flash message
    flash[:message] = "Successfully created song."

    #redirect
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :"/songs/edit"
  end

  patch '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:name] #Update song name if needed

    #update artist if any change is made
    if @song.artist.name != params[:name]

      #find artist by name via slugifeidname, if not, create new artist and set to artist instance variable
      @artist ||= Artist.find_by_slug(params[:artist])

      if @artist.name != params[:artist]
        @artist ||= Artist.create(name: params[:artist])
      end
    end

    #update genres based on what was selected
    @song.genres.clear
    params[:genres].each do |genre_id|
      genre = Genre.find_by_id(genre_id)
      @song.genres << genre
    end

    #shovel song into artist songs array
    @artist.songs << @song

    #update artist
    @artist.save

    #set flash message
    flash[:message] = "Successfully updated song."

    #redirect
    redirect to("/songs/#{@song.slug}")
  end

end

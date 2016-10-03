class SongsController < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    enable :sessions
    use Rack::Flash

    get '/songs' do
      @songs = Song.all
      erb :'songs/index'
    end

    post '/songs' do
      @artist = Artist.find_by(name: params[:song][:artist][:name])
      @artist = Artist.create(params[:song][:artist]) if @artist.nil?
      @song = Song.new
      @song.name = params[:song][:name]
      @song.artist = @artist
      params[:song][:genre_ids].each do |genre_id|
        @song.genres << Genre.find(genre_id)
      end
      @song.save
      flash[:message] = "Successfully created song."
      redirect "/songs/#{@song.slug}"
    end

    patch '/songs' do
      @artist = Artist.find_by(name: params[:song][:artist][:name])
      @artist = Artist.create(params[:song][:artist]) if @artist.nil?
      @song = Song.find(params[:song][:id])
      @song.name = params[:song][:name]
      @song.artist = @artist
      @song.genres.clear
      params[:song][:genre_ids].each do |genre_id|
        @song.genres << Genre.find(genre_id)
      end
      @song.save
      flash[:message] = "Successfully updated song."
      redirect "/songs/#{@song.slug}"
    end

    get '/songs/new' do
      erb :'songs/new'
    end

    get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
      erb :'songs/edit'
    end

    get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      erb :'songs/show'
    end

end

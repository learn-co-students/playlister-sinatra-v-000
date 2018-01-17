class SongController < Sinatra::Base
  enable :sessions
  use Rack::Flash
  set :session_secret, "my_application_secret"

  set :views, Proc.new { File.join(root, "../views/songs") }

  get "/songs" do
    @songs = Song.all
    erb :index
  end

  get "/songs/new" do
    erb :new
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :show
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    erb :edit
  end

  post "/songs/new" do
    @song = Song.create(params[:song])
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  post '/songs/:slug' do
   @song = Song.find_by_slug(params[:slug])
   @song.update(params[:song])
   @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
   @song.save

   flash[:message] = "Successfully updated song."
   redirect "/songs/#{@song.slug}"
 end

end

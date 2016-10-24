class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  enable :sessions 

  get '/' do
    erb :index
  end

  # patch '/songs/:slug' do
  #   @song = Song.find_by_slug(params[:slug])
  #   @song.name = params[:song][:name]
  #   @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
  #   @song.genre_ids = params[:genres]
  #   @song.save
  #   flash[:message] = "Successfully updated song."
  #   redirect to("/songs/#{@song.slug}")
  # end
end


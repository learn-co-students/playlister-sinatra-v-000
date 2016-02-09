class SongsController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/songs") }

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :show
  end

  post '/songs' do
  #code to create a new song and save to DB
  erb :'songs/show', locals: {message: "Successfully created song."}
end
end

require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  use Rack::Flash

  get '/songs' do
    erb :'/songs/index'
  end

  post '/songs' do
    song = Song.create(params[:song])

    if !Artist.find_by(name: params[:artist][:name])
      artist = Artist.create(params[:artist])
      # binding.pry
    else
      artist = Artist.find_by(name: params[:artist][:name])
      # binding.pry
    end

    if params[:genres]
      params[:genres].each do |id|
        song.genres << Genre.find(id)
      end
    end

    artist.songs << song
    artist.save
    # binding.pry
# binding.pry
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :"/songs/show"
  end

  post '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.name = params[:song][:name] if params[:song][:name] != ""
    # binding.pry
    if params[:artist][:name] != ""
      # binding.pry
      song.artist.name = params[:artist][:name]
    end
    song.artist.save
    # binding.pry
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

end

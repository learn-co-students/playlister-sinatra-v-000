require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  # configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    set :session_secret, "my_application_secret"
    use Rack::Flash

  # end

  get '/' do
    erb :index
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    artist_name = params[:artist_name]

    if Artist.find_by(name: artist_name)
      @artist = Artist.find_by(name: artist_name)
    else
      @artist = Artist.create(name: artist_name)
    end

    # binding.pry
    @song.update(name: params[:songs][:name], artist: @artist)
    @song.genres.clear

    params[:songs][:genres].each do |genre|
      @song.genres << Genre.find(genre)
    end

    # binding.pry
    redirect :"/songs/#{params[:slug]}"
  end
end

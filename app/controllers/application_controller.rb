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
    binding.pry
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:songs][:name], artist: Artist.find_by(name:params[:songs][:artist][:name]))
    @song.genres.clear

    params[:songs][:genres].each do |genre|
      @song.genres << Genre.find(genre)
    end

    redirect :"/songs/#{params[:slug]}"
  end
end

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  patch '/songs/:slug' do
    @song = Song.find(params[:slug])
    @song.update(name: params[:songs][:name], artist: Artist.find_by(name:params[:songs][:artist][:name]))
    @song.genres.clear

    params[:songs][:genres].each do |genre|
      @song.genres << Genre.find(genre)
    end
    # raise params.inspect
    binding.pry
    redirect :"/songs/#{params[:slug]}"
  end
end

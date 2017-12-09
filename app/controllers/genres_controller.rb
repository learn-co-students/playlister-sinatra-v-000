class GenresController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/genres' do
    @genres = Genre.all
    erb :"/genres/index"
  end

  get '/genres/:slug' do
    # binding.pry
    @genres = Genre.find_by_slug(params[:slug])
    @artists = @genres.artists
    erb :"genres/show"
  end

end

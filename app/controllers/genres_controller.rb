class GenresController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params["slug"])
    erb :'genres/show'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end
end

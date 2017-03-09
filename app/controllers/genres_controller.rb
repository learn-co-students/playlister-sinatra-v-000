class GenresController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/genres' do
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.all.find_by_slug(params[:slug])
    erb :'genres/show'
  end


end

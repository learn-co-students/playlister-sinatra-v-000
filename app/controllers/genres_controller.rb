class GenreController < Sinatra::Base
   register Sinatra::ActiveRecordExtension
   set :session_secret, "my_application_secret"
   set :views, Proc.new { File.join(root, "../views/") }

  get '/genres' do
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @slug = params[:slug]
    @genre = Genre.find_by_slug(@slug)
    # binding.pry
    erb :'/genres/show'
  end
end
class GenreController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/genres") }

  get '/genres' do
    erb :index
  end

  get '/genres/:slug' do 
    @genre = Genre.find_by_slug(params[:slug])
    erb :show
  end
end
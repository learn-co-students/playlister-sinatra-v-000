class GenresController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/genres/") }
  
  get '/genres' do
    @genres = Genre.all
    erb :index
  end
end
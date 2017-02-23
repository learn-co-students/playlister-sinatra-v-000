class GenresController < Sinatra::Base
set :views, Proc.new { File.join(root, "../views/") }

  get '/genres' do
    erb :index
  end

end 

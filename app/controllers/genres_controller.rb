class GenresController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }


    get "/genres" do
      @genres = Genre.all
      erb :"genres/index"
    end

  end

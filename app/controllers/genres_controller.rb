class GenresController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }


    get "/genres" do
      @genres = Genre.all
      erb :"genres/index"
    end

    get "/genres/:slug" do
      @genre = Genre.find_by_slug(params[:slug])
      erb :"genres/show"
    end

  end

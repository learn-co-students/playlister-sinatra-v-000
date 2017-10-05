class GenresController < ApplicationController
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/genres/") }

    get '/genres' do
        @genres = Genre.all
        erb :index
    end

    get '/:slug' do
        @genre = Genre.find_by_slug(name: params[:slug])
        erb :show
    end
end
class ArtistsController < ApplicationController
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/")}

    get '/artists' do
        @artist = Artist.all
        erb :"artists/index"
    end

    get '/artists/:slug' do
        slug = params[:slug]
        @artist = Artist.find_by_slug(slug)
        erb :"artists/show"
    end

    # get '/artists' do
    #     "Hello World"
    #   end


end

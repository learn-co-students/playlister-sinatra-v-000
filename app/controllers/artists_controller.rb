class ArtistsController < ApplicationController
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/")}

    get '/artist' do
        @artist = Artist.all
        erb :"artists/index"
    end

    get '/artist/:slug' do
        slug = params[:slug]
        @artist = Artist.find_by_slug(slug)
        erb :"artist/show"
    end



end

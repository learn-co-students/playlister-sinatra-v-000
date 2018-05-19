class GenresController < ApplicationController

    get '/genres' do
      @genres = Genre.all
      erb :'/genres/index'
    end

    get '/genres/:slug' do
      @genre = Genre.find_by_slug(:slug).first # <<-- find_by_slug is reporting ALL genres for some reason
      @song_genres = SongGenre.all
      erb :'/genres/show'
    end

    delete '/genres/:slug/delete' do
      @genre = Genre.find_by_slug(params[:slug])
      @genre.delete
      redirect to '/genres'
    end

end

# rspec spec/features/04_basic_view_spec.rb

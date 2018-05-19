class GenresController < ApplicationController

    get '/genres' do
      @genres = Genre.all
      erb :'/genres/index'
    end

    get '/genres/:slug' do
      @genre = Genre.find_by_slug(:slug)
      @song_genres = SongGenre.all
      erb :'/genres/show'
    end

end

# rspec spec/features/04_basic_view_spec.rb

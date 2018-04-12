class GenresController < ApplicationController
  get '/genres' do
    #displays a list of genres
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    #displays the genre's artists
    #{"captures"=>[], "slug"=>"genre"}
    # #<Genre:0x0000000491ddc8 id: 1, name: "New Age Garbage">
    @genre = Genre.find_by_slug(params["slug"])
    erb :'/genres/show'
  end

end

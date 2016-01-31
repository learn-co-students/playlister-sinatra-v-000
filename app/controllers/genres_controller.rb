class GenreController < Sinatra::Base

  get '/genres' do
    @genres = Genre.all
    @genres.collect do |g|
      "<ol><li><a href='/genres/#{g.slug}'>#{g.name}</a></li></ol>"
    end
  end

end

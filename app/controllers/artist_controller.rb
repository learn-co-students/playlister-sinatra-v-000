class ArtistController < Sinatra::Base


  get '/artists' do
    @artists = Artist.all
    @artists.collect do |a|
      "<ol><li><a href='/artists/#{a.slug}'>#{a.name} </a></li></ol> "
    end
  end

end

class ArtistsController <ApplicationController

    get '/artists' do

      @artists = Artist.all
#binding.pry
      erb :'/artists/index'
    end
    get '/artists/:slug' do

      @artist = Artist.all.find_by_slug(params[:slug])
#    binding.pry
      erb :'/artists/show'
    end

end


#setup use ArtistsController in our confi.ru file

#   rspec spec/features/04_basic_view_spec.rb

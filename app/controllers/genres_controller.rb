class GenresController <ApplicationController

    get '/genres' do
      @genres = Genre.all
#binding.pry
      erb :'/genres/index'
    end
    get '/genres/:slug' do  #sets a dymanic link

      @genre = Genre.all.find_by_slug(params[:slug])
  #  binding.pry
      erb :'/genres/show'
    end

end


#setup use GenressController in our confi.ru file

#   rspec spec/features/04_basic_view_spec.rb

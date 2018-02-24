class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all

    erb :"/genres/index"
  end

  get '/genres/:id' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :"/genres/show"
  end

  helpers do
    def slug
      self.name.gsub(" ", "-").downcase
    end

    def find_by_slug(slug)
      self.all.find { |instance| instance.slug == slug}
    end
  end

end

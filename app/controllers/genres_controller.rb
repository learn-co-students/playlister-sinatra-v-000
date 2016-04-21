class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/new' do
    erb :'/genres/new'
  end

  post '/genres' do
    @genre = Genre.create(params[:genre])
    if !params["pet"]["name"].empty?
    @genre.pets << Pet.create(name: params["pet"]["name"])
    end
    @genre.save
    redirect "genres/#{@genre.slug}"
  end

  get '/genres/:slug/edit' do
    @genre = Genre.find(params[:slug])
    erb :'/genres/edit'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end

  post '/genres/:id' do
      @genre = Genre.find_by_slug(params[:slug])
  @genre.update(params["genre"])
  if !params["pet"]["name"].empty?
    @genre.pets << Pet.create(name: params["pet"]["name"])
  end
  redirect to "genres/#{@genre.slug}"
  end
end
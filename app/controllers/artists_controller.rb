class ArtistsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :"artists/show"
  end

end

# describe "/artists/:slug" do
#   before do
#     visit "/artists/#{@artist.slug}"
#   end
#
#   it 'responds with a 200 status code' do
#     expect(page.status_code).to eq(200)
#   end
#
#   it "displays the artist's songs" do
#     expect(page).to have_content(song_name)
#   end
#
#   it "displays the artist's genres" do
#     expect(page).to have_content(genre_name)
#   end
#
#   it "contains links to each song's show page" do
#     expect(page).to have_css("a[href='/songs/#{@song.slug}']")
#   end
#
#   it "contains links to each genre's show page" do
#     expect(page).to have_css("a[href='/genres/#{@genre.slug}']")
#   end
# end

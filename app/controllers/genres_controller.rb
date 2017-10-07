class GenresController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :"genres/show"
  end

end

# describe "/genres/:slug" do
#   before do
#     visit "/genres/#{@genre.slug}"
#   end
#
#   it 'responds with a 200 status code' do
#     expect(page.status_code).to eq(200)
#   end
#
#   it "displays the genre's artists" do
#     expect(page).to have_content(artist_name)
#   end
#
#   it "displays the genre's songs" do
#     expect(page).to have_content(song_name)
#   end
#
#   it "contains links to each artist's show page" do
#     expect(page).to have_css("a[href='/artists/#{@artist.slug}']")
#   end
#
#   it "contains links to each song's show page" do
#     expect(page).to have_css("a[href='/songs/#{@song.slug}']")

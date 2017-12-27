

class ArtistsController < Sinatra::Base

  get '/artists' do
    erb :'/artists/index'
  end
end

=begin

describe "/artists" do
  before do
    visit "/artists"
  end

  it 'responds with a 200 status code' do
    expect(page.status_code).to eq(200)
  end

  it "displays a list of artists" do
    expect(page).to have_content(artist_name)
  end

  it "contains links to each artist's show page" do
    expect(page).to have_css("a[href='/artists/#{@artist.slug}']")
  end
end

=end

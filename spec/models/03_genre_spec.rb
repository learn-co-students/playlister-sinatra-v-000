require 'spec_helper'

describe "Genre" do
  let!(:genre) { Genre.create(:name => "Pop") }

  let!(:taylor_swift) { Artist.create(:name => "Taylor Swift") }
  let!(:mark_ronson) { Artist.create(:name => "Mark Ronson") }

  let!(:blank_space) { Song.create(:name => "Blank Space", :artist => taylor_swift) }
  let!(:uptown_funk) { Song.create(:name => "Uptown Funk!", :artist => mark_ronson) }

  let!(:blank_pop) { SongGenre.create(:song_id => blank_space.id, :genre_id => genre.id) }
  let!(:uptown_pop) { SongGenre.create(:song_id => uptown_funk.id, :genre_id => genre.id) }


  it "can initialize a genre" do
    expect(Genre.new).to be_an_instance_of(Genre)
  end

  it "has a name" do
    expect(genre.name).to eq("Pop")
  end

  it "has many songs" do
    expect(genre.songs.count).to eq(2)
  end

  it "has many artists" do
    expect(genre.artists.count).to eq(2)
  end

  it "can slugify it's name" do
    genre = Genre.create(:name => "Alternative Rock")
    genre.slug

    expect(genre.slug).to eq("alternative-rock")
  end

  describe "Class methods" do
    it "given the slug can find a genre" do
      genre = Genre.create(:name => "Alternative Rock")
      Genre.find_by_slug(genre.slug)

      expect((Genre.find_by_slug(genre.slug)).name).to eq("Alternative Rock")
    end
  end
end
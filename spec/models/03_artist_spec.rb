require 'spec_helper'

describe "Artist" do
  let(:artist) { Artist.create(:name => "Taylor Swift") }

  let!(:blank_space) { Song.create(:name => "Blank Space", :artist => artist) }
  let!(:shake_it_off) { Song.create(:name => "Shake It Off", :artist => artist) }

  let!(:pop) { Genre.create(:name => "Pop") }
  let!(:funk) { Genre.create(:name => "Funk") }

  let!(:blank_pop) { SongGenre.create(:song_id => blank_space.id, :genre_id => pop.id) }
  let!(:blank_funk) { SongGenre.create(:song_id => blank_space.id, :genre_id => funk.id) }


  it "can be initialized" do
    expect(artist).to be_an_instance_of(Artist)
  end

  it "can have a name" do
    expect(artist.name).to eq("Taylor Swift")
  end

  it "has many songs" do
    expect(artist.songs.count).to eq(2)
  end

  it "can have many genres" do
    expect(artist.genres.count).to eq(2)
  end

  it "can slugify it's name" do
    artist.slug

    expect(artist.slug).to eq("taylor-swift")
  end

  describe "Class methods" do
    it "given the slug can find a Artist" do
      Artist.find_by_slug(artist.slug)

      expect((Artist.find_by_slug(artist.slug)).name).to eq("Taylor Swift")
    end
  end

end
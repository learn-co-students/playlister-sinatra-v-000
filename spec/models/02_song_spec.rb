require 'spec_helper'

describe "Song" do
  let!(:artist) { Artist.create(:name => "Taylor Swift") }

  let!(:song) { Song.create(:name => "Blank Space", :artist => artist) }

  let!(:pop) { Genre.create(:name => "Pop") }
  let!(:funk) { Genre.create(:name => "Funk") }

  let!(:song_genres_pop) { SongGenre.create(:song_id => song.id, :genre_id => pop.id) }
  let!(:song_genres_funk) { SongGenre.create(:song_id => song.id, :genre_id => funk.id) }

  it "can initialize a song" do
    expect(Song.new).to be_an_instance_of(Song)
  end

  it "can have a name" do
    expect(song.name).to eq("Blank Space")
  end

  it "can have many genres" do 
    expect(SongGenre.count).to eq(2)
  end

  it "has an artist" do
    expect(song.artist).to eq(artist)
  end

  it "can slugify it's name" do
    song.slug

    expect(song.slug).to eq("blank-space")
  end

  describe "Class methods" do
    it "given the slug can find a song" do
      Song.find_by_slug(song.slug)

      expect((Song.find_by_slug(song.slug)).name).to eq("Blank Space")
    end
  end
end
require 'spec_helper'

describe "Playlister Basics" do
  let(:artist_name) { "Person with a Face" }
  let(:genre_name) { "New Age Garbage" }
  let(:song_name) { "That One with the Guitar" }

  before do
    @song = Song.create(name: song_name)
    @genre = Genre.create(name: genre_name)
    @artist = Artist.create(name: artist_name)

    @song.song_genres.create(genre: @genre)
    @song.artist = @artist
  
    @song.save
  end

  describe "index pages" do
    describe "/songs" do
      before do
        visit "/songs"
      end

      it 'responds with a 200 status code' do
        expect(page.status_code).to eq(200)
      end
    end

  end
end
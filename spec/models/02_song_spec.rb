require 'spec_helper'

describe "Song" do
  before do 
    @artist = Artist.create(:name => "Taylor Swift") 

    @song =  Song.create(:name => "Blank Space", :artist => @artist) 

    pop = Genre.create(:name => "Pop")

    @song.genre_ids = pop.id
    
  end

  it "can initialize a song" do
    expect(Song.new).to be_an_instance_of(Song)
  end

  it "can have a name" do
    expect(@song.name).to eq("Blank Space")
  end

  it "can have many genres" do 
    expect(SongGenre.count).to eq(1)
  end

  it "has an artist" do
    expect(@song.artist).to eq(@artist)
  end

  it "can slugify its name" do

    expect(@song.slug).to eq("blank-space")
  end

  describe "Class methods" do
    it "given the slug can find a song" do
      slug = "blank-space"

      expect((Song.find_by_slug(slug)).name).to eq("Blank Space")
    end
  end
<<<<<<< HEAD
=======
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 4893c8254f01a1e7ac64050428c63757f1574e8d
=======
>>>>>>> origin
>>>>>>> 59fcdd050bdcb32ebe31b27573f12073bec2da82
end

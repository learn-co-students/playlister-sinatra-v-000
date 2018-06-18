require 'spec_helper'

puts describe "Artist" do
  before do
    @artist = Artist.create(:name => "Taylor Swift")

    blank_space =  Song.create(:name => "Blank Space", :artist => @artist)

    pop = Genre.create(:name => "Pop")

    blank_space.genre_ids = pop.id

  end

puts  it "can be initialized" do
    expect(@artist).to be_an_instance_of(Artist)
  end

  puts it "can have a name" do
    expect(@artist.name).to eq("Taylor Swift")
  end

puts   it "has many songs" do
    expect(@artist.songs.count).to eq(1)
  end

  puts it "can have many genres" do
    expect(@artist.genres.count).to eq(1)
  end

  puts it "can slugify its name" do

    expect(@artist.slug).to eq("taylor-swift")
  end

  puts describe "Class methods" do
    it "given the slug can find an Artist" do
      slug = "taylor-swift"
      expect((Artist.find_by_slug(slug)).name).to eq("Taylor Swift")
    end
  end

end

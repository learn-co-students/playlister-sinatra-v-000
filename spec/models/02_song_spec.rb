require 'spec_helper'

<<<<<<< HEAD
describe 'Song' do
  before do
    @artist = Artist.create(name: 'Taylor Swift')

    @song = Song.create(name: 'Blank Space', artist: @artist)
=======
describe "Song" do
  before do
    @artist = Artist.create(:name => "Taylor Swift")

    @song =  Song.create(:name => "Blank Space", :artist => @artist)
>>>>>>> song varibales

    pop = Genre.create(name: 'Pop')

    @song.genre_ids = pop.id
<<<<<<< HEAD
=======

>>>>>>> song varibales
  end

  it 'can initialize a song' do
    expect(Song.new).to be_an_instance_of(Song)
  end

  it 'can have a name' do
    expect(@song.name).to eq('Blank Space')
  end

<<<<<<< HEAD
  it 'can have many genres' do
=======
  it "can have many genres" do
>>>>>>> song varibales
    expect(SongGenre.count).to eq(1)
  end

  it 'has an artist' do
    expect(@song.artist).to eq(@artist)
  end

  it 'can slugify its name' do
    expect(@song.slug).to eq('blank-space')
  end

  describe 'Class methods' do
    it 'given the slug can find a song' do
      slug = 'blank-space'

      expect(Song.find_by_slug(slug).name).to eq('Blank Space')
    end
  end
end

class CreateSongs < ActiveRecord::Migration
  #rspec spec/models/01_artist_spec.rb
  # Song.create(:name => "Blank Space", :artist = @artist)

  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
    end
  end
end

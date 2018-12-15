class CreateArtists <ActiveRecord::Migration
  def change do |artist|
    artist.string :name
    end
  end
end

class DropArtistsGenresTable < ActiveRecord::Migration
  def up
    drop_table :artists_genres
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

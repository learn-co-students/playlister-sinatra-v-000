class ChangeTableName < ActiveRecord::Migration
  def change
    drop_table :song_genre

    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end

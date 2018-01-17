class CreateSongsTable < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
      # t.belongs_to :artist, index: true
      #
    end
  end
end


  # implement as a second migration or within this one
  #   add_column :songs, :artist_id, :integer

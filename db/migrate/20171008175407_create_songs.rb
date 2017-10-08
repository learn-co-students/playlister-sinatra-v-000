class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |s|
      s.string :name

    end
  end
end

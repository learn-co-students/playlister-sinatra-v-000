class LibraryParsers < ActiveRecord::Migration
  def change
    create_table :library_parsers do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end

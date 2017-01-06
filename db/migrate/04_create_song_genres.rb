class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
      t.timestamps null: false
    end
  end
end

# https://github.com/jonbf/sinatra-complex-forms-associations-v-000/tree/solution/db/migrate
# suggests that this file name should end in table.rb, but that causes migration to abort.
# http://stackoverflow.com/questions/413150/when-i-run-the-rakedb-migrate-command-i-get-an-error-uninitialized-constant-cr
# apparently provides the reason why: the file name must exactly match the class name

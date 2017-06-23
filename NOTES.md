:conditions => ['BINARY pid = ?', params[:pid]]

Song.where('lower(name)' => bb)
=> #<Song::ActiveRecord_Relation:0x1cab54c>

.values

class Song 
    belongs_to :artist 
    has_many :song_genres 
    has_many :genres through: :songs 
end 
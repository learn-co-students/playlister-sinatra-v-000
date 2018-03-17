class Artist < Sinatra::Base
    has_many :Songs
    has_many :Genres, through::Songs
end

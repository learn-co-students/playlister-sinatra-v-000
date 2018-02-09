class Genre < ActiveRecord::Base
  has_many :artists, :songs

end

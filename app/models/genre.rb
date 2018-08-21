class Genre < ActiveRecord::Base
  has_many :artists
end
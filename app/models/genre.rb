class Genre < ActiveRecord::Base
  has_many :Songs
  has_many :Artists, through::Songs
end

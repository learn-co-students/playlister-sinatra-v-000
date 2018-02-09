class Artist < ActiveRecord::Base
  has_many :books, :genres

end

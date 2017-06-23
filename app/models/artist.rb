class Artist < ActiveRecord::Base
extend Concerns::Slugify_class
include Concerns::Slugify_instance


      has_many :songs
      has_many :genres, through: :songs


         
end

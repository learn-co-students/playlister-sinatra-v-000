require_relative '../../lib/slug.rb'

class Song < ActiveRecord::Base
   has_many :song_genres
   belongs_to :artist
   has_many :genres, through: :song_genres

   extend Slug::ClassMethods
   include Slug::InstanceMethods

end

require_relative 'concerns/slugifiable.rb'


class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
    extend Slugify::ClassMethods
    include Slugify::InstanceMethods
end

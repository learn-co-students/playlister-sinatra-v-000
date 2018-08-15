require_relative 'concerns/slugifiable'

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  # move these codes into modules 'slugifiable.rb'
  # def slug
  #    maxlength = 35
  #    title = name.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase
  #    return title[0, title.length > maxlength ? (title[0, maxlength].rindex('-') or maxlength) : maxlength]
  # end
  #
  # def self.find_by_slug(slug)
  #   Song.all.find{|song| song.slug == slug}
  # end
end

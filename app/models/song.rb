
class Song < ActiveRecord::Base

  require_relative './concerns/slugifiable'
  include Slugifiable
  extend Findable
  
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist #needs foreign key
end
=begin
  
02_song_spec.rb   
03_genre_spec.rb 04_basic_view_spec.rb  05_song_form_spec.rb

=end
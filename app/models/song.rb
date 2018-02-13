class Song < ActiveRecord::Base
  belongs_to  :artist
  has_many    :song_genres
  has_many    :genres, through: :song_genres
  # before_save :downcase_fields

  def slug
    Slugifiable.slugify(self.name)
  end

  def self.find_by_slug(slug)
    Song.where("LOWER(name) = ?", Slugifiable.unslugify(slug)).first
    # binding.pry
  end

  # private
  #   def downcase_fields
  #     self.name.downcase!
  #   end
end

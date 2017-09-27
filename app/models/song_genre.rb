class SongGenre < ActiveRecord::Base
  belongs_to :song, :class_name => 'Song', :foreign_key => 'song_id'
  belongs_to :genre, :class_name => 'Genre', :foreign_key => 'genre_id'

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.each do |instance|
      if instance.slug == slug
        return instance
      end
    end
  end

end

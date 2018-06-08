class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre

  def slug
    self.name.gsub(/\s/, "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find do |my_obj|
      my_obj.slug == slug
    end
  end
end

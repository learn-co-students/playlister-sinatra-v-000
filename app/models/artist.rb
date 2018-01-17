class Artist<ActiveRecord::Base
  include Slugifiable
  has_many :songs
  has_many :genres, through: :songs

  def self.find_by_slug(slug)
    self.all.find {|song| song.slug == slug}
  end

end
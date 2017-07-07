class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    @found = []
    self.all.each do |x|
      if x.slug == slug
        @found << x
      end
    end
    @found[0]
  end
end

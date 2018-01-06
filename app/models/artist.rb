class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres

  def slug
    @slug = name.gsub(/[^\s\w]/, '').gsub(/\s{1,}/, '-')
  end

  def find_by_slug(slug)
    char = slug.gsub('-', ' ')
    self.all.detect {char}
  end
end

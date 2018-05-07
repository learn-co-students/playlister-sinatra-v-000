module Slugify
  def slug
    self.name.downcase.strip.gsub(' ','-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.detect { |artist| artist.slug == slug }
  end
end

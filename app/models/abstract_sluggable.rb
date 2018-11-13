class AbstractSluggable < ActiveRecord::Base

  self.abstract_class = true

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.find {|e| e.slug == slug}
  end

end

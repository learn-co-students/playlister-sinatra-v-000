class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.find{|x| x.slug == slug}
  end
end

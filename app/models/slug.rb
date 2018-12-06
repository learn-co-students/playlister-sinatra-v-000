class Slug < ActiveRecord::Base
  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find {|instance| instance.slug == slug}
    end
  end

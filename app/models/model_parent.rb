class ModelParent < ActiveRecord::Base
  def slug
    self.name.gsub(/\s+/, '-').downcase
  end

  def self.find_by_slug(slug)
    self.find do |a|
      a.slug == slug
    end
  end
end

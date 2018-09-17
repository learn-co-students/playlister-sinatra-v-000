class Slug < ActiveRecord::Base
  def slug
    self.name.gsub(" ","-").downcase
  end

  def self.find_by_slug(slug)
    self.all.select do |instance|
      instance.slug == slug
    end[0]
  end
end
# I would love to abstract these methods here, but I think the classes need to inherit directly from ActiveRecord::Base themselves, due to their associations

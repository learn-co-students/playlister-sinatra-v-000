module Slugifiable
  def slug
    self.name.gsub(" ", "-").downcase
  end
end

module Slugifiable_Class
  def find_by_slug(slug)
    self.all.find { |instance| where instance.slug == slug }
  end
end

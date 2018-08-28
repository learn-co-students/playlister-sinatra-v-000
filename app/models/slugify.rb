module Slugify

  def make_slug(name)
    name.gsub(/[^a-zA-Z0-9]/, "-").gsub(/-{2,}/, "-").downcase
  end

  def find_by_slug(slug)
    self.find_by(slug: slug)
  end

end

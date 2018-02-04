module Concerns::Slugifiable

  def find_by_slug(slug)
    self.all.detect{|variable| variable.slug == slug}
  end

end

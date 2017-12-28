module Slug_Cl

  def find_by_slug(slug)
    self.find do |s|
      s.slug == slug
    end
  end
end

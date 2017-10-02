module Slugify

  def slug
    self.name.gsub(' ', '-').downcase
  end

end

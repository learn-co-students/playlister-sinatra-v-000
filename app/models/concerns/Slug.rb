module Slug
  def slug
    self.name.gsub(' ','-').downcase
  end
end

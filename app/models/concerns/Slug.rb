module Slug
  def slug
    self.name.downcase.gsub(' ','-')
  end
end

module Slugifiable

  def find_by_slug(arg)
    self.all.detect {|object| object.slug == arg}
  end

  def slug
    self.name.downcase.split(' ').join('-')
  end

end
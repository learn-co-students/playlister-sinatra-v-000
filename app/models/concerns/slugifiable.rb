module Slugifiable
  def slug
    self.name.gsub(/[^0-9A-Za-z" "]/, '').downcase.split(" ").join("-")
  end

  def find_by_slug(slug)
    @all = self.all
    @all.detect {|ob| ob.slug == slug}
  end
end
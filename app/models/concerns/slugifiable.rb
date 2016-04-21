module Slugifiable

  def find_by_slug(arg)
    test = arg.split('-').map(&:capitalize).join(' ')
    self.all.detect {|object| object.name.downcase == test.downcase}
  end

  def slug
    self.name.downcase.split(' ').join('-')
  end

end
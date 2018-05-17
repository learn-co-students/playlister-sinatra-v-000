module Slugifiable
  def slug
    name = self.name.strip.downcase
    name.gsub! /['`]/,""
    name.gsub! /\s*@\s*/, " at "
    name.gsub! /\s*&\s*/, " and "
    name.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'
    name.gsub! /_+/,"-"
    name.gsub! /\A[_\.]+|[_\.]+\z/,""
    name
  end

  def find_by_slug(arg)
    self.all.detect do |x|
      x.slug == arg
    end
  end
end

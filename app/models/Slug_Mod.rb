require "pry"
module Slug_Mod
  def slug
    name.downcase.gsub " ", "-"
  end
end

module Find_By_Slug_Mod
  def find_by_slug(name_to_find)
    self.all.detect{ |inst| inst.slug == name_to_find }
  end
end

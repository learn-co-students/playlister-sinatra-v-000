class Slugifiable < ActiveRecord::Base
  def slug(name)
    new_name = name.downcase.strip.gsub(' ','-')
    new_name
  end
end

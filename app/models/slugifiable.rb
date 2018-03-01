module Slugifiable
  module InstanceMethods

  def slug
    name.downcase.gsub(" ","-")
  end
 end
end

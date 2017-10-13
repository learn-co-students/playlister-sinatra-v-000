module Slugifiable

  module ClassMethods

    def find_by_slug(input)
      unslugged_input = input.split("-").map{|w| w.capitalize}.join(" ")


      output ||= Artist.where('name like ?', unslugged_input).first
      output ||= Song.where('name like ?', unslugged_input).first
      output ||= Genre.where('name like ?', unslugged_input).first
    end
  end

  module InstanceMethods

    def slug
      slugified_name = self.name.split.map {|w| w.downcase}.join('-')
    end
  end
end

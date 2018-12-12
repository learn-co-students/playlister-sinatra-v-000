class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def artist
    @artist ||= Artist.find_by_name(params[:artist])
  end

  def slug
    self.name.split(/\W/).map {|word| word.downcase unless word.empty?}.compact.join('-')
  end

  def self.find_by_slug(slug)
    unslugged = []
    unslug_arr = slug.split('-')
    self.all.map do |obj|
      if obj.name.downcase.include?(unslug_arr[0]) && obj.name.downcase.include?(unslug_arr[-1])
        unslugged << obj
      end
    end
    self.find_by_name(unslugged.first.name)
  end

end

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    # split_name = slug.strip.split('-')
    # name = ""
    # split_name.collect! do |part|
    #   part.capitalize
    #   name += part.capitalize + " "
    # end
    self.all.each do |song|
      if song.slug == slug
        return song
      end
    end
    #
    # self.find_by(name: name.strip!)
  end

end

# rspec spec/models/02_song_spec.rb

# rspec spec/features/04_basic_view_spec.rb
# learn --f-f << -- only reports the first spec failure

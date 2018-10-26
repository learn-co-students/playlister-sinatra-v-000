class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres


    def slug
      name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.find_by_slug( slug)
      self.all.find{|data| data.slug == slug}
      #name.split.join(' ').gsub('-',' ').split.map(&:capitalize).join(' ')
    end
  end

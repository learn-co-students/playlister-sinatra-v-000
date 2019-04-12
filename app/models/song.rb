class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :songs_genres
  has_many :genres, through: :songs_genres
end







# From: AR Railes Lesson
# has_many :through
# To work with the join table, both our Post and Tag models will have a has_many association
# with the posts_tags table. We also still need to associate Post and Tag themselves.
# Ideally, we'd like to be able to call a @my_post.tags method, right?
# That's where has_many :through comes in.
#
# To do this requires a bit of focus. But you can do it! First of all,
#   let's add the has_many :posts_tags line to our Post and Tag models:
#
# class Post
#   has_many :posts_tags
# end
#
# class PostsTag
#   belongs_to :post
#   belongs_to :tag
# end

class Tag
  has_many :posts_tags
end


***

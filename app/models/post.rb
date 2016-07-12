class Post < ActiveRecord::Base
  has_many :comments, dependent: :destory
end

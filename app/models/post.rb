class Post < ActiveRecord::Base
  attr_accessible :content, :user_id 
  belongs_to :user
  
  default_scope order: 'posts.created_at DESC'
end

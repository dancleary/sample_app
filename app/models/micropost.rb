class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
           user_id: user.id)
  end
  
  def self.search(search)
    
    if User.find_by_name(search)
      search = User.find_by_name(search).id
    
      
      find(:all, :conditions => ['user_id LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end

class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
  has_many :comments

  def posts
    return User.find_by(id: self.user_id)
  end

end

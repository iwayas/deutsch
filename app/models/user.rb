class User < ApplicationRecord
  validates :name, {presence: true}
  validates :name, length: { minimum: 1, maximum: 8 }
  VALID_EMAIL_REGEX = /@/
    validates :email, {presence: true, uniqueness: true}
    validates :email, format: { with: VALID_EMAIL_REGEX,
      message: "に@が含まれていません" }
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,12}+\z/i
    validates :password, {presence: true}
    validates :password, format: { with: VALID_PASSWORD_REGEX,
      message: "は半角英数字を含む8-12文字"}
  has_many :comments

  def posts
    return User.find_by(id: self.user_id)
  end

end

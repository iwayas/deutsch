class GuestSessionsController < ApplicationController
  def create
    user = User.find_or_create_by(email: "guest@exapmle.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.image_name = "default_user.png"
    end
      session[:user_id] = user.id
      redirect_to("/users/#{user.id}")
  end
end
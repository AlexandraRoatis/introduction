class UsersController < ApplicationController
  def index
    @users = User.all.sort_by { |u| -u.points }
    @count = Story.select(:user_id).distinct.count
  end
end

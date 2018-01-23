class UsersController < ApplicationController
  def index
    @users = User.all.sort_by { |u| -u.points }
  end
end

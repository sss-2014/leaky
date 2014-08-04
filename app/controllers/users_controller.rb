class UsersController < ApplicationController
  def index
    @users = if params[:q]
               User.where("name ILIKE '%#{params[:q]}%'")
             else
               User.all
             end
  end
end

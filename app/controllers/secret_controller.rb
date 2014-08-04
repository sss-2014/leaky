class SecretController < ApplicationController
  before_action :check_permission

  def index
    render json: {success: true}
  end

  private
  def check_permission
    @user = User.where(api_key: Digest::SHA512.hexdigest(params[:key])).first if params[:key]
    render status: 403, json: {error: 'Not going to happen!'} unless @user
  end
end

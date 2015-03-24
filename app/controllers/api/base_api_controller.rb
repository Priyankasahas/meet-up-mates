class Api::BaseApiController < ApplicationController
  def require_api_authentication!
    render :json => {'error' => 'Unauthorized'}, :status => 401 unless params[:auth_token]
    user = User.where(authentication_token: params[:auth_token]).first
    set_current_user(user)
  end

  private
  def set_current_user(user)
    @current_user = user
  end
end
class Api::V1::SessionsController < Devise::SessionsController
  def create
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :json => {:info => "Logged in", :user => current_user}, :status => 200
  end

  def destroy
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_out
    render :json => { :info => "Logged out" }, :status => 200
  end

  def failure
    render :json => { :error => "Login Credentials Failed" }, :status => 401
  end

end

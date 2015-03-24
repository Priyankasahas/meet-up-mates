class Api::V1::GroupsController < Api::BaseApiController
  before_filter :require_api_authentication!

  respond_to :json

  def index
    groups = @current_user.groups
    if !groups.empty?
      render json: groups, status: :ok
    else
      render json: [], status: :not_found
    end
  end

  def show
    group = Group.find(params[:id])
    if @current_user.groups.include? group
      render json: group, status: :ok
    else
      render json: [], status: :unauthorized
    end
  end

  def new
    @group = Group.new
  end

  def create
    group = @current_user.groups.create(group_params)
    if group.save!
      render json: group, status: :ok
    else
      render json: {errors: group.errors}, status: :unprocessable_entity
    end
  end

  def update
    @group = Group.find(params[:id])
    @group.update_attributes(group_params)
    if @group.save!
      render json: @group, status: :ok
    else
      render :json => @group.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    render json: nil, status: :ok
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end



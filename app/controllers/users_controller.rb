class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :destroy, :update]

  def edit
  end

  def update

  	@user.update(user_params)
  	@user.save
  	redirect_to user_path
  end

  def show
    # @user_groups = @user.groups
  end

  def destroy 
  	@user.destroy
  	redirect_to users_path
  end

  private

    def user_params
    	params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :avatar, :birthday, :group_ids =>[]) 
    end

    def find_user
    		@user = User.find_by_id(params[:id])
    end

end

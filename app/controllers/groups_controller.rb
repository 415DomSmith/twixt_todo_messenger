class GroupsController < ApplicationController
  before_action :confirm_logged_in
	before_action :find_group, except: [:index, :new, :create]

# ==========================================================================
# ==== ONLY FINDS AND RENDERS GROUPS THAT THE CURRENT USER BELONGS TO ======
# ==========================================================================
  def index
    @groups = current_user.groups
  end

##### THIS MIGHT NOT BE NECESSARY SINCE WE DO THE SAME IN APP CONTROLLER ##### 
  def new
  	@group = Group.new
  end

# ========================================================
# ==== TWEAKED TO ALLOW GROUP CREATION FROM NAB BAR ======
# ========================================================
  def create
  	@group = Group.new(group_params)
    @group.associations.build(user_id: session[:user_id] ) 
    if @group.save
  	  redirect_to groups_path
    else 
      render groups_path
    end
  end

  def edit
  end

  def update
  	@group.update group_params
  	redirect_to group_path(@group)
  end

  def show
  end

  def destroy
  	@group.destroy
  	redirect_to groups_path
  end

  private
  	def group_params
  		params.require(:group).permit(:name, :user_id, :format, :group_id)
  	end

  	def find_group
  		@group = Group.find_by_id params[:id]
  	end

end

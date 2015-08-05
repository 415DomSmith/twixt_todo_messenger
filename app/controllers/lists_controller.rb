class ListsController < ApplicationController
  before_action :find_group, only: [:index, :new, :create]
  before_action :find_list, except: [:index, :new, :create]
  before_action :find_users_in_group, only: [:index]

  def index
    @list = List.new
    @lists = @group.lists
  end

  def new
    @list = List.new
  end

  def create
    @list = @group.lists.create(list_params)
    if @list.save
      redirect_to group_lists_path(@group)
    else 
      render group_lists_path(@group), flash: {alert: "Failed to Create New List"}
    end
  end

  def edit
  end

  def update
    @list.update list_params
    @list.save
    redirect_to list_path
  end
  
  def show
  end

  def destroy
    @list.destroy
    redirect_to group_lists_path(@list.group)
  end

  def find_group 
    @group = Group.find_by_id(params[:group_id]) 
  end

  private

    def list_params
      params.require(:list).permit(:name, :created, :group_id)
    end

    def find_list
      @list = List.find_by_id(params[:id])
    end

    def find_users_in_group
      @members = @group.users.all
    end


end

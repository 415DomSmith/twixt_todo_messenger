class ItemsController < ApplicationController
  before_action :find_list, only: [:index, :new, :create]
  before_action :find_item, except: [:index, :new, :create]

# ==========================================================================
# ==== WE SEND JSON FROM OUR ITEMS INDEX, IT DOESN'T RENDER A PAGE =======
# ==========================================================================
  def index
    @items = Item.where(:list_id => @list.id)
    render json: @items
  end

  def new
    @item = Item.new
  end

  def create
    @item = @list.items.create(item_params)
    @item.save
    redirect_to group_lists_path(@list.group)
  end

  def edit
  end

  def update
    @item.update(item_params)
    @item.save
    redirect_to group_lists_path(@list.group)
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to list_items_path(@list)
  end

  def find_list
    @list = List.find_by_id(params[:list_id])
  end

  private

    def item_params
      params.require(:item).permit(:name, :created, :image_url, :list_id)  #:complete, :priority,
    end

    def find_item
      @item = Item.find_by_id(params[:list_id])
    end

end

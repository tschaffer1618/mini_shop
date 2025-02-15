class ItemsController < ApplicationController

  def index
    if params[:merchant_id]
      @merchant = Merchant.find(params[:merchant_id])
      @items = @merchant.items
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def new
  end

  def destroy
    Item.destroy(params[:id])
    redirect_to '/items'
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to "/items/#{@item.id}"
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    @item = merchant.items.create(item_params)
    redirect_to "/merchants/#{merchant.id}/items"
  end

  private
  def item_params
    params.permit(:name, :description, :price, :image, :status, :inventory)
  end
end

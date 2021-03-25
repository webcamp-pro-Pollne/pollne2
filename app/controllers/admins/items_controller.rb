class Admins::ItemsController < ApplicationController

  before_action :autheniticate_admin

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.save
    redirect_to admins_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to admins_items_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admins_items_path
  end

  private

  def items_params
    params.require(:item).permit(:name, :genre_id, :image, :introduction, :price, :is_active)
  end
end

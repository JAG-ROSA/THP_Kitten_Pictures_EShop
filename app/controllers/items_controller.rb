class ItemsController < ApplicationController
  def index
    @items = Item.all
    
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
    
  end

  def create
  end

  def update
  end

  def destroy
  end
end

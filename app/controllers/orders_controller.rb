class OrdersController < ApplicationController
  
  def show
  end
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(params[:order])
  end
  
end

class OrdersController < ApplicationController
    
    before_action :authenticate_user!

    def index
        @orders = Order.where(user_id: current_user.id)
    end


    def show
        @order = Order.find(params[:id])
        @product = @order.product
    end

  def new
    @product = Product.find(params[:product_id])
    @order = Order.new

  end
  
  def create 
    product = Product.find(params[:order][:product_id])
    @order = Order.new(order_params) 
    @order.user_id = current_user.id
    add_quantity
    @order.save
    redirect_to orders_path
  end
  
  
  def destroy
    Order.find(params[:id]).destroy
    redirect_to orders_path
  end

 
  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to orders_path
end


    private
    def order_params
        params.require(:order).permit(:quantity, :user_id , :product_id )
    end


    def add_quantity
        product = Product.find(params[:order][:product_id])
        @product = @order.product  
        @product.stock -= @order.quantity
        @product.save
      end


end
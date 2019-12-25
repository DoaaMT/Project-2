class ProductsController < ApplicationController

     before_action :authenticate_user!

    def index
        @products = Product.all
        # @products = Product.where(user_id: current_user.id)
    end

    def new
      @product = Product.new
    end

    def create  
        puts params          
        @product = Product.new(product_params) 
        @product.user_id = current_user.id
        @product.save
        redirect_to @product 
    end

    
    def update
        product = Product.find(params[:id])
        product.update(params.require(:product).permit(:name, :price, :img, :description, :user_id, :stock,  :order_ids => [] ))
        redirect_to product 
    end

    

    def edit
        @product = Product.find(params[:id])
    end


    def destroy
        Product.find(params[:id]).destroy
        redirect_to products_path
    end

    
    def show
        @product = Product.find(params[:id])
        # This code below has a quick demo of how to form a json object with nested ingredients on a recipe.
        #render json: @product, include: :orders
    end

    def showit
        @products = Product.where(user_id: current_user.id)
    end    


   

    private
    def product_params
        params.require(:product).permit(:name, :price, :img, :description, :user_id, :stock,  :order_ids => [] )
    end

end
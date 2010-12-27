class ProductsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @product = @list.products.build(params[:product])
    flash[:alert] = 'Failed adding product to the list' unless @product.save
    
    redirect_to @list
  end

end

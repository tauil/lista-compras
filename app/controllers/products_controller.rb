class ProductsController < ApplicationController

  respond_to :js, :html
  before_filter :load_list

  def create
    @product = @list.products.build(params[:product])

    flash[:alert] = 'Fail to receive the product. Double check the fields.' unless @product.save

    respond_with @product
  end
  
  def destroy
    @product = @list.products.find(params[:id])
    
    flash[:alert] = 'Failed trying to delete the product.' unless @product.destroy

    respond_with @product
  end
  
  def load_list
    @list = List.find(params[:list_id])
  end

end
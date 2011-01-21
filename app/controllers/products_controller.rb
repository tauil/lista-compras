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
  
  def complete
    product_ids = @list.products.collect(&:id)
    @list.products.update_all(["done = ?", false], :id => product_ids - params[:product_ids].collect(&:to_i))
    @list.products.update_all(["done = ?", true], :id => params[:product_ids])
    redirect_to list_path(@list)
  end

end
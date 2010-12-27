class ProductsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @product = @list.products.build(params[:product])

    flash[:alert] = 'Fail to receive the product. Double check the fields.' unless @product.save

    respond_to do |format|
      format.html { redirect_to @list }
      format.js
    end
  end

end

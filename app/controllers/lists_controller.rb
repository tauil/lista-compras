class ListsController < ApplicationController

  respond_to :html, :xml, :json

  def index
    @lists = List.all

    respond_with @list
  end

  def show
    @list = List.find(params[:id])

    respond_with @list
  end

  def new
    @list = List.new

    respond_with @list
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(params[:list])

    flash[:notice] = 'List was successfully created.' if @list.save

    respond_with @list
  end

  def update
    @list = List.find(params[:id])

    flash[:notice] = 'List was successfully updated.' if @list.update_attributes(params[:post])

    respond_with @list
  end
 
  def destroy
    @list = List.find(params[:id])

    flash[:notice] = 'List was successfully deleted.' if @list.destroy

    respond_with @list
  end
end

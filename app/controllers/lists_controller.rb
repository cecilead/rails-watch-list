class ListsController < ApplicationController
  before_action :set_list, only: %i[show]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
  end

  def create
    @list = List.new(params_list)
    @list.save
    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def params_list
    params.require(:list).permit(:name, :photo)
  end
end

class MaterialsController < ApplicationController

  def index
    @materials = Material.paginate(page: params[:page])
  end

  def show
    @material = Material.find(params[:id])
  end

  def new
    @material = Material.new
  end
end

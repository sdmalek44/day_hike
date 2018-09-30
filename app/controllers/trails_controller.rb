class TrailsController < ApplicationController
  def show
    @trail = Trail.find(params[:id]) if params[:id]
  end
end

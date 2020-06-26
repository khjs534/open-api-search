class Api::V1::TheftsController < ApplicationController
before_action :find_theft, only: [:show, :update, :destroy]

  def index
    @thefts = Theft.all.order("created_at desc")
    @thefts = @thefts.where("title LIKE ?", '%' + params[:title] + '%') if params[:title]
    @thefts = @thefts.where("description LIKE ?", '%' + params[:description] + '%') if params[:description]
    @thefts = @thefts.where("address LIKE ?", '%' + params[:address] + '%') if params[:address]

    render json: @thefts
  end

  def show
    render json: @theft
  end

  def create
    @theft = Theft.new(theft_params)

    @theft.save
    render json: @theft, status: 201
  end

  def update
    @theft.update(theft_params)
    render json: { message: 'Theft successfully updated' }, status: 200
  end

  def destroy
    if @theft
      @theft.destroy
      render json: { message: 'Theft successfully deleted' }, status: 204
    else
      render json: { error: 'Unable to delete theft' }, status: 400
    end
  end

  private

  def theft_params
    params.require(:theft).permit(:title, :description, :address, :source_url, :image_url)
  end

  def find_theft
    @theft = Theft.find(params[:id])
  end
end


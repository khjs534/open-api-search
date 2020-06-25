class Api::V1::TheftsController < ApplicationController
before_action :find_theft, only: [:show, :update, :destroy]

  def index
    @thefts = Theft.all.order("created_at desc")

    render json: @thefts
  end

  def show
    render json: @theft
  end

  def create
    @theft = Theft.new(theft_params)

    if @theft.save
      render json: @theft, status: 201
    else
      render json: { error: 'Unable to create theft', status: 422 }
    end
  end

  def update
    if @theft
      @theft.update(fact_params)
      render json: { message: 'Theft successfully updated' }, status: 200
    else
      render json: { error: 'Unable to update theft' }, status: 422
    end
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
    params.require(:theft).permit(:title, :description)
  end

  def find_theft
    @theft = Theft.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      render json: { error: 'This theft record does not exist' }, status: 404
  end
end


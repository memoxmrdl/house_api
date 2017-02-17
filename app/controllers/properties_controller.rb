class PropertiesController < ApplicationController
  before_action :find_property, except: [:index, :create]

  def index
    @properties = Property.all

    render json: @properties
  end

  def show
    render json: @property
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: { response: false, message: @property.errors.full_messages.join(', ') }, status: :bad_request
    end
  end

  def update
    if @property.update(property_params)
      render json: @property, status: :ok, location: @property
    else
      render json: { response: false, message: @property.errors.full_messages.join(', ') }, status: :bad_request
    end
  end

  private

  def find_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:title, :address, :zipcode, :country, :notes, :house_type)
  end
end

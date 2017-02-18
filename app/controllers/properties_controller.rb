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
      render_json @property, :ok
    else
      render_error @property, :bad_request
    end
  end

  def update
    if @property.update(property_params)
      render_json @property, :ok
    else
      render_error @property, :bad_request
    end
  end

  def destroy
    @property.destroy
    render json: @property
  end

  private

  def find_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:title,
                                     :notes,
                                     :address,
                                     :zipcode,
                                     :country,
                                     :house_type)
  end
end

class PropertiesController < ApplicationController
  before_action :find_property, except: [:index, :create]

  def index
    @properties = Property.all

    render json: @properties
  end

  def show
    render json: @property
  end

  private

  def find_property
    @property = Property.find(params[:id])
  end
end

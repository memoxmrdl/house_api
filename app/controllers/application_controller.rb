class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :bad_request

  private

  def not_found
    render json: {}, status: :not_found
  end

  def bad_request
    render json: {}, status: :bad_request
  end

  def render_error(resource, status)
    render json: resource, status: status, serializer: ErrorSerializer, adapter: :attributes
  end

  def render_json(resource, status)
    render json: resource, status: status, location: resource, adapter: :attributes
  end
end

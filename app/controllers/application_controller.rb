class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found
    render json: {}, status: :not_found
  end

  def bad_request
    render json: {}, status: :bad_request
  end
end

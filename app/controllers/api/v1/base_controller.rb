class Api::V1::BaseController < ApplicationController
  load_and_authorize_resource

  after_filter :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def index
    query = resource_klass.accessible_by(current_ability)
    render json: query.where(actual_query)
  end

  def create
    model = resource_klass.new(model_params)
    if model.save
      render json: model
    else
      render json: model.errors, status: 400
    end
  end
 
  def update
    model = resource_klass.find(params[:id])
 
    if model.update(model_params)
      render json: model
    else
      render json: model.errors, status: 400
    end
  end

  def show
    model = resource_klass.find(params[:id])
    render json: model
  end

  def destroy
    model = resource_klass.find(params[:id])
 
    if model.destroy
      render json: model
    else
      render json: model.errors, status: 400
    end
  end

  private 

  def actual_query 
    params[:query] ? JSON.parse(params[:query]) : {}
  end

  protected

  # In Rails 4.2 and above
  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end
end
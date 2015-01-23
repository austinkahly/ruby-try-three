class Api::V1::BaseController < ApplicationController

  load_and_authorize_resource

  def index
    models = resource_klass.all

    render json: models
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

end
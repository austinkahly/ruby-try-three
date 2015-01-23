class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  prepend_before_filter :fix_cancan_params, only: :create

  # from https://github.com/ryanb/cancan/issues/835#issuecomment-20229737
  def fix_cancan_params
    return if devise_controller?
    method = "#{resource_name}_params"
    if respond_to?(method, true)
      params[resource_name] &&= send(method)
    else
      raise "Must define method named #{method} in #{controller_name}."
    end
  end

  protected

  def resource_klass
    resource_name.classify.constantize
  end

  def resource_name
    controller_name.underscore.split('/').last.singularize
  end

  def model_params
    send("#{resource_name}_params")
  end

end

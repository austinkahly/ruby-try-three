# from https://github.com/sstephenson/sprockets/issues/218
# allows using view helpers, url helpers in asset files
module ViewContext
  attr_accessor :output_buffer

  def output_buffer_with_sprockets=(buffer)
    unless is_sprockets?
      output_buffer_without_sprockets=(buffer)
    end
  end

  def is_sprockets?
    self.try(:environment).class == Sprockets::Index
  end

  def self.included(klass)
    klass.instance_eval do
      alias_method_chain :output_buffer=, :sprockets
    end
  end

  def protect_against_forgery?
    false
  end
end

Rails.application.assets.context_class.class_eval do
  include ActionView::Helpers
  include Rails.application.routes.url_helpers
  include ViewContext
end
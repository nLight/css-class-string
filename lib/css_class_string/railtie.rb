require 'css_class_string/view_helpers'

module CssClassString
  class Railtie < Rails::Railtie
    initializer "css_class_string.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end

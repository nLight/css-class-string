require "css_class_string/helper"

module CssClassString
  module ViewHelpers
    def class_string(*args)
      ::CssClassString::Helper.new(*args).to_s
    end
  end
end

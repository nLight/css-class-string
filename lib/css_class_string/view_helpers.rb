require "css_class_string/helper"

module CssClassString
  module ViewHelpers
    def class_string(hash)
      ::CssClassString::Helper.new(hash).to_s
    end
  end
end

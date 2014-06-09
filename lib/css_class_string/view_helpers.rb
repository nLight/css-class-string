module CssClassString
  module ViewHelpers
    def class_string(hash)
      hash.inject({}) {|memo, (k, v)| 
        if k.is_a?(Array)
          memo.merge({k[0] => v, k[1] => !v})
        else
          memo.merge({k => v})
        end
      }.map {|class_name, present| 
        class_name if present 
      }.join(" ")
    end
  end
end

module CssClassString
  class Helper
    def initialize(class_hash)
      @class_hash = class_hash
    end

    def to_s
      @class_hash.inject({}) {|memo, (k, v)| 
        if k.is_a?(Array)
          memo.merge({k[0] => v, k[1] => !v})
        else
          memo.merge({k => v})
        end
      }.map {|class_name, present| 
        class_name if present 
      }.compact.join(" ")
    end
  end
end

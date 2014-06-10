module CssClassString
  class Helper
    def initialize(class_hash)
      @class_hash = class_hash
    end

    def to_s
      @class_hash.map { |((tc, fc), v)| v ? tc : fc }.compact.join(" ")
    end
  end
end

module CssClassString
  class Helper
    def initialize(*args)
      options     = args.last.is_a?(::Hash) ? args.pop : {}
      @class_hash = args.map {|class_name| { class_name => true }}.reduce({}, &:merge)
      @class_hash.merge!(options)
    end

    def to_s
      @class_hash.map { |((tc, fc), v)| v ? tc : fc }.compact.join(" ")
    end
  end
end

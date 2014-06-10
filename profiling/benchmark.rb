require 'benchmark'
require 'securerandom'
require 'css_class_string/view_helpers'
include CssClassString::ViewHelpers

NUM_CALLS = 40_000

def class_name
  SecureRandom.hex(4)
end

def true_or_false
  [true, false].sample
end

arrays = Enumerator.new { |y| y << [[class_name, class_name], true_or_false] }
strings = Enumerator.new { |y| y << [class_name, true_or_false] }

Benchmark.bm do |b|
  b.report("With 1 array and 1 string values") do
    NUM_CALLS.times do
      class_string(Hash[arrays.take(1) + strings.take(1)])
    end
  end

  b.report("With 5 array and 5 string values") do
    NUM_CALLS.times do
      class_string(Hash[arrays.take(5) + strings.take(5)])
    end
  end

  b.report("With 10 array values") do
    NUM_CALLS.times do
      class_string(Hash[arrays.take(10)])
    end
  end

  b.report("With 10 string values") do
    NUM_CALLS.times do
      class_string(Hash[strings.take(10)])
    end
  end
end
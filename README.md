# CssClassString

Helper for creating css class strings inspired by ReactJS classSet

- Pass bare arguments for default classes
- Pass hash of `class => <boolean>` for conditional classes
- Use array with two classes as a `key` and first will be used for truthy and second for falsey value `[:true?, :false?] => <boolean>`

## Installation

Add this line to your application's Gemfile:

    gem 'css-class-string'

## Usage

```haml
  // @boolvalue = true
  %span{class: class_string({some: true, classy: false, [:truthy, :falsy] => @boolvalue})}
  // equal to
  %span{class: class_string('some', falsy: false, [:truthy, :falsy] => @boolvalue)}
  // => <span class="some truthy"></span>
```

```html+erb
  <!-- @boolvalue = false -->
  <span class="<%= class_string({some: true, classy: true, [:truthy, :falsy] => @boolvalue} %>">
  <!-- equal to -->
  <span class="<%= class_string('some', 'classy', [:truthy, :falsy] => @boolvalue %>">
  <!-- => <span class="some classy falsy"></span> -->
```

Outside a view

```ruby
CssClassString::Helper.new({}).to_s
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

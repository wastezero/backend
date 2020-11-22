Blueprinter.configure do |config|
  config.if = ->(field_name, obj, _options) { obj[field_name].present? || obj["#{field_name.to_s}_id"].present? }
end
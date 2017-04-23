# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
Mime::Type.register "application/vnd.api+json", :jsonapi

ActionDispatch::Request.parameter_parsers.merge!(
  jsonapi: lambda { |b| JSON.parse(b).with_indifferent_access }
)

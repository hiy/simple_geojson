# frozen_string_literal: true

class SimpleGeoJSON
  # https://www.rfc-editor.org/rfc/rfc7946#section-3.2
  class Feature
    attr_reader   :uuid
    attr_accessor :geometry, :properties, :bbox

    def initialize(geometry:, properties: {}, bbox: [])
      @type       = "Feature"
      @geometry   = geometry
      @properties = properties
      @bbox       = bbox
      @uuid       = SecureRandom.uuid
    end

    def self.parse(json); end

    def <<(element); end

    def to_hash
      feature              = {}
      feature[:type]       = @type
      feature[:bbox]       = @bbox if @bbox.any?
      feature[:properties] = @properties.to_hash
      feature[:geometry]   = @geometry.to_hash
      feature
    end
  end
end

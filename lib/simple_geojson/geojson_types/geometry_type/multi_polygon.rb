# frozen_string_literal: true

class SimpleGeoJSON
  # https://www.rfc-editor.org/rfc/rfc7946#section-3.1.7
  # For type "MultiPolygon", the "coordinates" member is an array of
  # Polygon coordinate arrays.
  class MultiPolygon
    attr_accessor :polygons

    def initialize(coordinates)
      @type        = "MultiPolygon"
      @uuid        = SecureRandom.uuid
      @polygons    = coordinates.map { |c| Polygon.new(c) }
    end

    def self.parse(json); end

    def valid?
      true
    end

    def to_hash
      {
        type: @type,
        coordinates: @polygons.map(&:coordinates)
      }
    end

    def to_json(*_args)
      to_hash.to_json
    end
  end
end

# frozen_string_literal: true

class SimpleGeoJSON
  # https://www.rfc-editor.org/rfc/rfc7946#section-3.1.4
  # For type "LineString", the "coordinates" member is an array of two or
  # more positions.
  class LineString
    attr_accessor :positions

    def initialize(coordinates)
      @type        = "LineString"
      @uuid        = SecureRandom.uuid
      @positions   = coordinates.map { |c| Position.new(c) }
    end

    def self.parse(json); end

    def valid?
      true
    end

    def to_hash
      {
        type: @type,
        coordinates: @positions.map { _1.coordinates }
      }
    end

    def to_json(*_args)
      to_hash.to_json
    end
  end
end

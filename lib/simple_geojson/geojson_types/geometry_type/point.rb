# frozen_string_literal: true

class SimpleGeoJSON
  # https://www.rfc-editor.org/rfc/rfc7946#section-3.1.2
  # For type "Point", the "coordinates" member is a single position.
  class Point
    attr_accessor :position

    def initialize(coordinates)
      @type     = "Point"
      @uuid     = SecureRandom.uuid
      @position = Position.new(coordinates)
    end

    def self.parse(json); end

    def valid?
      @position.coordinates.size >= 2
    end

    def to_hash
      {
        type: @type,
        coordinates: @position.coordinates
      }
    end

    def to_json(*_args)
      to_hash.to_json
    end
  end
end

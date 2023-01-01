# frozen_string_literal: true

class SimpleGeoJSON
  # https://www.rfc-editor.org/rfc/rfc7946#section-3.1.3
  # For type "MultiPoint", the "coordinates" member is an array of positions.
  class MultiPoint
    attr_accessor :positions

    def initialize(coordinates)
      @type        = "MultiPoint"
      @uuid        = SecureRandom.uuid
      @positions   = coordinates.map do |c|
        case c
        when Array
          Position.new(c)
        when Point
          Position.new(c.coordinates)
        else
          raise
        end
      end
    end

    def self.parse(json); end

    def valid?
      true
    end

    def to_hash
      {
        type: @type,
        coordinates: @positions.map(&:coordinates)
      }
    end

    def to_json(*_args)
      to_hash.to_json
    end
  end
end

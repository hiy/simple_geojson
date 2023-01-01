# frozen_string_literal: true

class SimpleGeoJSON
  # https://www.rfc-editor.org/rfc/rfc7946#section-3.1.5
  # For type "MultiLineString", the "coordinates" member is an array of
  # LineString coordinate arrays.
  class MultiLineString
    attr_accessor :line_strings

    def initialize(coordinates)
      @type         = "MultiLineString"
      @uuid         = SecureRandom.uuid
      @line_strings = coordinates.map { |c| LineString.new(c) }
    end

    def self.parse(json); end

    def valid?
      true
    end

    def to_hash
      {
        type: @type,
        coordinates: @line_strings.map { |ls| ls.positions.map(&:coordinates) }
      }
    end

    def to_json(*_args)
      to_hash.to_json
    end
  end
end

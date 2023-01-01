# frozen_string_literal: true

class SimpleGeoJSON
  # https://www.rfc-editor.org/rfc/rfc7946#section-3.1.6
  # To specify a constraint specific to Polygons, it is useful to
  # introduce the concept of a linear ring:
  class Polygon
    attr_accessor :exterior_ring, :interior_ring

    def initialize(coordinates)
      @type          = "Polygon"
      @uuid          = SecureRandom.uuid
      @exterior_ring = (coordinates[0] || []).map { |c| Position.new(c) }
      @interior_ring = (coordinates[1] || []).map { |c| Position.new(c) }
    end

    def self.parse(json); end

    def valid?
      true
    end

    def to_hash
      {
        type: @type,
        coordinates: coordinates
      }
    end

    def coordinates
      linear_ring = []

      linear_ring << @exterior_ring.map(&:coordinates) if @exterior_ring.any?

      linear_ring << @interior_ring.map(&:coordinates) if @interior_ring.any?

      linear_ring
    end

    def to_json(*_args)
      to_hash.to_json
    end
  end
end

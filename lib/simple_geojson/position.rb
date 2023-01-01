# frozen_string_literal: true

class SimpleGeoJSON
  # https://www.rfc-editor.org/rfc/rfc7946#section-3.1.1
  class Position
    attr_accessor :coordinates

    def initialize(coordinates)
      @coordinates = coordinates
    end

    def [](index)
      @coordinates[index]
    end

    def lon
      coordinates[0]
    end

    alias longitude lon
    alias easting   lon

    def lat
      coordinates[1]
    end

    alias latitude  lat
    alias northing  lat

    def alt
      coordinates[2]
    end

    alias altitude  alt
    alias elevation alt
  end
end

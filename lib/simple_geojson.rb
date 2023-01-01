# frozen_string_literal: true

require "json"
require "securerandom"
require 'forwardable'

require_relative "simple_geojson/version"
require_relative "simple_geojson/geojson_types/geometry_type/point"
require_relative "simple_geojson/geojson_types/geometry_type/multi_point"
require_relative "simple_geojson/geojson_types/geometry_type/line_string"
require_relative "simple_geojson/geojson_types/geometry_type/multi_line_string"
require_relative "simple_geojson/geojson_types/geometry_type/polygon"
require_relative "simple_geojson/geojson_types/geometry_type/multi_polygon"
require_relative "simple_geojson/geojson_types/geometry_type/geometry_collection"
require_relative "simple_geojson/geojson_types/feature"
require_relative "simple_geojson/geojson_types/feature_collection"
require_relative "simple_geojson/bounding_box"
require_relative "simple_geojson/position"

# https://www.rfc-editor.org/rfc/rfc7946
class SimpleGeoJSON
  extend Forwardable
  def_delegators :@feature_collection,
                :<<, 
                :add_point, :add_multi_point,
                :add_line_string, :add_multi_line_string,
                :add_polygon, :add_multi_polygon,
                :add_geometry_collection,
                :find, :update, :delete, :valid?,
                :to_hash, :to_json

  # geometry type
  # Inside this document, the term "geometry type" refers to seven
  # case-sensitive strings: "Point", "MultiPoint", "LineString",
  # "MultiLineString", "Polygon", "MultiPolygon", and
  # "GeometryCollection".
  GEOMETRY_TYPE = [
    Point, 
    MultiPoint,
    LineString, 
    MultiLineString,
    Polygon,
    MultiPolygon,
    GeometryCollection
  ].freeze
  
  # GeoJSON types
  # As another shorthand notation, the term "GeoJSON types" refers to
  # nine case-sensitive strings: "Feature", "FeatureCollection", and
  # the geometry types listed above.
  GEOJSON_TYPES = (GEOMETRY_TYPE + [Feature, FeatureCollection]).freeze

  def self.parse(json_string)
    JSON.parse(json_string).each do |k, v|
      # TODO
    end
  end

  def initialize(bbox = nil)
    @feature_collection = FeatureCollection.new(bbox: bbox)
  end
end

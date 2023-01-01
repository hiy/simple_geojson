# frozen_string_literal: true

class SimpleGeoJSON
  # https://www.rfc-editor.org/rfc/rfc7946#section-3.3
  class FeatureCollection
    attr_accessor :features, :bbox

    def initialize(bbox: [])
      @type     = "FeatureCollection"
      @bbox     = bbox || []
      @features = {}
      @uuid     = 0
    end

    def self.parse(json); end

    def <<(feature_or_geometry)
      if feature_or_geometry.is_a?(Feature)
        @features[feature_or_geometry.uuid] = feature_or_geometry
        return feature_or_geometry
      end

      if GeometryType.include?(feature_or_geometry.class)
        feature = Feature.new(geometry: feature_or_geometry)
        @features[feature.uuid] = feature
        return feature
      end

      raise TypeError
    end

    def add_point(coordinates, properties: {}, bbox: [])
      point   = Point.new(coordinates)
      feature = Feature.new(geometry: point, properties: properties, bbox: bbox)
      self << feature
      feature
    end

    def add_multi_point(coordinates, properties: {}, bbox: [])
      multi_point = MultiPoint.new(coordinates)
      feature     = Feature.new(geometry: multi_point, properties: properties, bbox: bbox)
      self << feature
      feature
    end

    def add_line_string(coordinates, properties: {}, bbox: [])
      line_string = LineString.new(coordinates)
      feature     = Feature.new(geometry: line_string, properties: properties, bbox: bbox)
      self << feature
      feature
    end

    def add_multi_line_string(coordinates, properties: {}, bbox: [])
      multi_line_string = MultiLineString.new(coordinates)
      feature           = Feature.new(geometry: multi_line_string, properties: properties, bbox: bbox)
      self << feature
      feature
    end

    def add_polygon(coordinates, properties: {}, bbox: [])
      polygon     = Polygon.new(coordinates)
      feature     = Feature.new(geometry: polygon, properties: properties, bbox: bbox)
      self << feature
      feature
    end

    def add_multi_polygon(coordinates, properties: {}, bbox: [])
      multi_polygon  = MultiPolygon.new(coordinates)
      feature        = Feature.new(geometry: multi_polygon, properties: properties, bbox: bbox)
      self << feature
      feature
    end

    def add_geometry_collection(geometries)
    end

    def find(uuid)
      features[uuid]
    end

    def delete(uuid)
      features.delete(uuid)
    end

    def valid?
      true
    end

    def to_hash
      feature_collection            = {}
      feature_collection[:type]     = @type
      feature_collection[:bbox]     = @bbox if @bbox.any?
      feature_collection[:features] = @features.values.map(&:to_hash)
      feature_collection
    end

    def to_json(*_args)
      to_hash.to_json
    end
  end
end

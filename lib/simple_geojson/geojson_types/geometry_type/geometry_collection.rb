# frozen_string_literal: true

class SimpleGeoJSON
  # https://www.rfc-editor.org/rfc/rfc7946#section-3.1.8
  class GeometryCollection
    def initialize(_coordinates)
      @type        = "GeometryCollection"
      @uuid        = SecureRandom.uuid
    end

    def self.parse(json); end

    def valid?
      true
    end

    def to_json(*_args)
      to_hash.to_json
    end
  end
end

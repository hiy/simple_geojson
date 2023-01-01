# frozen_string_literal: true
class SimpleGeoJSON
  # https://www.rfc-editor.org/rfc/rfc7946#section-5
  class BoundingBox
    def initialize(_coordinates)
      @bbox = []
    end
  end
end
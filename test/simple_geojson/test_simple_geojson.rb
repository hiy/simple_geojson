# frozen_string_literal: true

require "test_helper"

class TestSimpleGeoJSON < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SimpleGeoJSON::VERSION
  end

  def test_empty_features
    geojson = SimpleGeoJSON.new

    assert_equal "{\"type\":\"FeatureCollection\",\"features\":[]}", geojson.to_json
  end
end

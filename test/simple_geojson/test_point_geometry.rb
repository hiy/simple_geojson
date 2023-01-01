# frozen_string_literal: true

require "test_helper"

class TestPointGeometry < Minitest::Test
  def test_empty_point
    point = SimpleGeoJSON::Point.new([])
    expected_hash = { type: "Point", coordinates: [] }

    assert_equal(expected_hash, point.to_hash)
    assert_equal(expected_hash.to_json, point.to_json)
  end

  def test_point_with_value
    point = SimpleGeoJSON::Point.new([100.211, 30.333, 111])
    expected_hash = { type: "Point", coordinates: [100.211, 30.333, 111] }

    assert_equal(expected_hash, point.to_hash)
    assert_equal(expected_hash.to_json, point.to_json)
  end
end

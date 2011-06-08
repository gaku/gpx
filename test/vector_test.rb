require 'test_helper'
require 'vector'

class VectorTest < Test::Unit::TestCase
  def test_dot_product
    a = GPX::Vector.new(1, 1)
    b = GPX::Vector.new(2, -1)
    assert_equal(1 * 2 + 1 * (-1), a.dot_product(b))
  end

  def test_magnitude
    v1 = GPX::Vector.new(2, 3)
    assert_equal(Math.sqrt(13), v1.magnitude)

    v2 = GPX::Vector.new(0, 0)
    assert_equal(0, v2.magnitude)
  end

  def test_unit_vector
    null_vector = GPX::Vector.new(0, 0)
    unit_vector = null_vector.unit_vector
    assert_equal(0, unit_vector.magnitude)

    v = GPX::Vector.new(2, 2)
    u2 = v.unit_vector
    assert_equal(u2.x, u2.y)
    assert_in_delta(1.0, u2.magnitude, 0.000001)
  end

end

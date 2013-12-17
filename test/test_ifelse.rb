require "test/unit"
require "ifelse"

class TestIfElse < Test::Unit::TestCase

  def test_if
    assert_equal 42, true.if {42}
    assert_false false.if {42}
  end

  def test_else
    assert_equal 35, true.if {35}.else {42}
    assert_equal 42, false.if {35}.else {42}
  end

  def test_errors
    assert_raise { true.if }
    assert_raise { false.if }
    assert_raise { true.if {42}.else }
    assert_raise { false.if {42}.else }
  end
end

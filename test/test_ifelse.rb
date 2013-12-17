require "test/unit"
require "ifelse"

class TestIfElse < Test::Unit::TestCase

  def test_if
    assert_equal 42, true.if {42}
    assert_equal 42, 3.if {42}
    assert_false false.if {42}
  end

  def test_unless
    assert_false true.unless {42}
    assert_false 3.unless {42}
    assert_equal 42, false.unless {42}
  end

  def test_errors
    assert_raise { true.if }
    assert_raise { false.if }
  end

  def test_readme
    x = 1
    assert_equal 'positive', (x >= 0).if {'positive'}
    assert_equal 'positive', (x < 0).unless {'positive'}

    h = {a: 42}
    assert_equal 42, h[:a].if {|n| n}
    assert_equal 'missing', h[:b].unless {'missing'}
  end
end

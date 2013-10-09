require 'minitest_helper'

class TestSortBytes < MiniTest::Unit::TestCase
  def setup
    @sorter = SortBytes::SizeSorter.new([])
  end

  def test_should_accept_decimals_in_byte_size
    assert_in_delta 2.5, @sorter.size_in_bytes('2.5B')
  end

  def test_should_return_size_with_no_suffix
    assert_in_delta 5.0, @sorter.size_in_bytes('5')
  end

  def test_should_return_size_with_b_suffix
    assert_in_delta 5.0, @sorter.size_in_bytes('5B')
  end

  def test_should_return_size_with_k_suffix
    assert_in_delta 5_000, @sorter.size_in_bytes('5K')
  end

  def test_should_return_size_with_m_suffix
    assert_in_delta 5_000_000, @sorter.size_in_bytes('5M')
  end

  def test_should_return_size_with_g_suffix
    assert_in_delta 5_000_000_000, @sorter.size_in_bytes('5G')
  end

  def test_should_return_size_with_t_suffix
    assert_in_delta 5_000_000_000_000, @sorter.size_in_bytes('5T')
  end

  def test_should_extract_size_token_from_line
    assert_equal '54K', @sorter.size_token(' 54K foo/bar/3')
  end

  def test_should_sort_by_byte_size
    lines = [
      '5T in terabytes',
      '6G in gigabytes',
      '7M in megabytes',
      '8K in kilobytes',
      '9B in bytes',
      '9 in bytes'
    ]
    @sorter.lines = lines
    assert_equal lines.reverse, @sorter.sorted
  end
end

require "sort_bytes/version"

module SortBytes
  class SizeSorter
    attr_accessor :lines

    def initialize(lines)
      @lines = lines
    end

    def sorted
      lines.map do |line|
        [ size_in_bytes(size_token(line)), line]
      end.sort.map(&:last)
    end

    def size_in_bytes(size)
      num, suffix = size.split(/([^0-9.]+)/)
      suffix ||= 'B'
      power = %w(B K M G T P).index(suffix[0,1]) * 3
      multiplier = 10 ** power
      num.to_f * multiplier
    end

    def size_token(line)
      line[/^\s*(\S+)/, 1]
    end
  end
end

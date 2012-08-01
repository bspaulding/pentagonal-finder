#! /usr/bin/env ruby

require_relative 'pentagonal_helpers.rb'
require 'ostruct'

Integer.send(:include, PentagonalHelpers)

class PentagonalFinder
  # Increments j starting at 1, and for each j computes each pair where k is j-1 down to 1.
  # It can be demonstrated, and perhaps proven, that as j increases, d for the pair P(j) / P(j-1) will increase.
  # Therefore, the first pair this algorithm runs into, should be the pair with the smallest d.
  def run(&block)
    j = 1
    result = nil

    while result.nil? do
      (j-1).downto(1).each do |k|
        sum = j.pentagonal + k.pentagonal
        difference = j.pentagonal - k.pentagonal
        d = difference < 0 ? difference * -1 : difference

        if block
          status = OpenStruct.new({ :j => j, :k => k, :d => d })
          block.call(status)
        end

        if sum.pentagonal? && difference.pentagonal?
          result = OpenStruct.new({ :j => j, :k => k, :d => d })
        end
      end

      j += 1
    end

    result
  end
end
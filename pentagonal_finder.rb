#! /usr/bin/env ruby

require_relative 'pentagonal_helpers.rb'
require 'ostruct'

Integer.send(:include, PentagonalHelpers)

class PentagonalFinder
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
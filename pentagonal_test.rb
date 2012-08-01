#! /usr/bin/env ruby

require_relative 'pentagonal_helpers.rb'
require 'minitest/spec'
require 'minitest/autorun'

Integer.send(:include, PentagonalHelpers)

describe PentagonalHelpers do
  describe "#pentagonal" do
    [1,5,12,22,35,51,70,92,117,145].each_with_index do |p,i|
      n = i + 1
      it "should return '#{p}' for P('#{n}')" do
        n.pentagonal.must_equal p
      end
    end

    it "P(4) + P(7) should equal P(8)" do
      (4.pentagonal + 7.pentagonal).must_equal 8.pentagonal
    end
  end

  describe "#pentagonal?" do
    [:inverse, :quadratic].each do |algorithm|
      [1,5,12,22,35,51,70,92,117,145].each do |p|
        it "[#{algorithm}] should return true for p = #{p}" do
          p.pentagonal?(algorithm).must_equal true
        end
      end

      it "[#{algorithm}] should return false for p = 48" do
        48.pentagonal?(algorithm).must_equal false
      end
    end
  end
end

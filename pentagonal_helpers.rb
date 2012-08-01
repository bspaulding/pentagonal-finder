#! /usr/bin/env ruby

module PentagonalHelpers
  def self.included(base)
    base.send(:include, QuadraticSolver)
  end

  def pentagonal
    n = self.to_i
    n * (3 * n - 1) / 2
  end

  # Returns true if the integer returned by to_i is pentagonal, false otherwise.
  # Performance of finding the first pair whose sum and difference are pentagonal:
  #   Quadratic solver => real  0m45.141s
  #   Inverse solver => real  0m30.988s
  def pentagonal?(algorithm = :inverse)
    p = self.to_i

    if algorithm == :quadratic
      quadratic_solutions = quadratic 3, -1, -(2 * p)
      x2 = quadratic_solutions[1]
      !x2.is_a?(Complex) && (x2 * 10) % 10 == 0.0
    else
      inverse = (Math.sqrt(24 * p + 1) + 1) / 6
      inverse == inverse.to_i
    end
  end

  module QuadraticSolver
    def quadratic(a,b,c)
      discriminant = b * b - 4 * a * c

      if discriminant >= 0
        x1 = (-b - Math.sqrt(discriminant)) / (2 * a)
        x2 = (-b + Math.sqrt(discriminant)) / (2 * a)
        [x1,x2]
      else
        x1 = (-b) / (2 * a)
        x2 = (Math.sqrt(discriminant * (-1))) / (2 * a)
        [Complex("#{x1}-#{x2}i"), Complex("#{x1}+#{x2}i")]
      end
    end
  end
end

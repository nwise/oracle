# frozen_string_literal: true

# Each Result is an row in an oracle table.
class Result
  attr_reader :roll, :description

  def initialize(roll:, description:)
    @roll = roll.to_i
    @description = description
  end

  def hit?(r)
    roll == r
  end
end

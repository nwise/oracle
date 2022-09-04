# frozen_string_literal: true

class Result
  attr_reader :roll, :description, :low, :high

  def initialize(data)
    @roll, @description = data.split(' ')
    @low, @high = roll.split('-').map(&:to_i)
    @high ||= low
  end

  def hit?(roll)
    roll >= low && roll <= high
  end
end

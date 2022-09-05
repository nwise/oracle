# frozen_string_literal: true

class OracleTable
  attr_reader :rows, :name, :table

  def initialize(filename:, name:)
    @name = name
    @rows = File.readlines(filename).flat_map do |row|
      roll, description = row.split(' ')
      first, last = roll.split('-')
      last = '100' if last == '00'
      if last
        (first..last).map do |r|
          Result.new(roll: r, description: description)
        end
      else
        Result.new(roll: roll, description: description)
      end
    end
    @table = @rows.index_by(&:roll)
  end

  def consult(roll: nil)
    roll ||= Random.rand(1, table.size)
    rows.find { |row| row.hit?(roll) }&.description
  end

  def random
    table.values.uniq.sample.description
  end
end

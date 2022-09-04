# frozen_string_literal: true

class OracleTable
  attr_reader :rows, :name

  def initialize(filename:, name:)
    @name = name
    @rows = File.readlines(filename).map do |row|
      Result.new(row)
    end
  end

  def consult(roll:)
    rows.find { |row| row.hit?(roll) }&.description
  end
end

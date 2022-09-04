# frozen_string_literal: true

require 'bundler/setup'
require 'thor'
require 'pry'
require_relative './b/oracle/oracle_table'
require_relative './b/result'

class Main < Thor
  desc 'Action', 'action'
  def act
    puts find_act
  end

  desc 'Theme', 'theme'
  def theme
    puts find_theme
  end

  desc 'Region', 'region'
  def region
    puts find_region
  end

  desc 'Locations', 'locations'
  def location
    puts find_location
  end

  desc 'Full Name', 'full-name'
  def full_name
    puts find_full_name
  end

  desc 'Character', 'character'
  def character
    puts find_character
  end

  desc 'Quest', 'quest'
  def find_quest; end

  no_commands do
    def consult(name:)
      File.readlines("data/#{name}.txt").sample.&strip
    end

    def find_character
      "#{find_act} #{find_full_name} at #{find_location}"
    end

    def find_full_name
      "#{consult(name: "names_1")} #{consult(name: "names_2")}"
    end

    def find_act
      OracleTable.new(filename: 'data/actions.txt', name: 'actions')
                 .consult(roll: Random.rand(1..100))
    end

    def find_theme
      consult(name: 'themes')
    end

    def find_location
      consult(name: 'locations')
    end

    def find_region
      consult(name: 'regions')
    end
  end
end

Main.start(ARGV)

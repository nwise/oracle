# frozen_string_literal: true

require 'active_support/all'
require_relative 'oracle/version'
require_relative 'oracle_table'
require_relative 'result'

module Oracle
  class Error < StandardError; end

  REGISTRY = {
    action: { filename: 'data/actions.txt', name: 'action' },
    challenge_rank: { filename: 'data/challenge_ranks.txt', name: 'challenge_rank' },
    character_description: { filename: 'data/char_desc.txt', name: 'character_description' },
    character_goal: { filename: 'data/char_goal.txt', name: 'character_goal' },
    character_role: { filename: 'data/char_role.txt', name: 'character_role' }
  }.freeze

  class Oracle
    class << self
      REGISTRY.each do |name, info|
        define_method(name) do
          OracleTable.new(**info)
        end
      end

      def list
        REGISTRY.keys
      end
    end
  end
end

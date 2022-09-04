# frozen_string_literal: true

require_relative 'test_helper'

describe OracleTable do
  subject { OracleTable.new(filename: 'FILE', name: 'Test Name') }

  before do
    File.stubs(:readlines).with('FILE').returns(['1 one', '2 two'])
  end

  describe 'initialization' do
    it 'defines @name' do
      assert_equal('Test Name', subject.name)
    end

    it 'defines @rows' do
      assert_equal(2, subject.rows.count)
    end
  end

  describe '#consult' do
    it 'returns the hit when there is one' do
      assert_equal('one', subject.consult(roll: 1))
    end

    it 'returns nothing when there is no hit' do
      assert_nil(subject.consult(roll: 100))
    end
  end
end

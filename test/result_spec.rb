# frozen_string_literal: true

require_relative 'test_helper'

describe Result do
  describe 'initialization' do
    it 'defines @roll' do
      subject = Result.new(roll: '2', description: 'Test')
      assert_equal(2, subject.roll)
    end

    it 'defines @desc' do
      subject = Result.new(roll: '2', description: 'Test')
      assert_equal('Test', subject.description)
    end
  end

  describe '#hit?' do
    describe 'for range' do
      it 'returns true when roll is equal' do
        subject = Result.new(roll: '2', description: 'Test')
        assert(subject.hit?(2))
      end

      it 'returns false when roll is low' do
        subject = Result.new(roll: '2', description: 'Test')
        refute(subject.hit?(1))
      end

      it 'returns false when roll below high and low' do
        subject = Result.new(roll: '2', description: 'Test')
        refute(subject.hit?(5))
      end
    end
  end
end

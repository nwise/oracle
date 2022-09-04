# frozen_string_literal: true

require_relative 'test_helper'

describe Result do
  describe 'initialization' do
    it 'defines @roll' do
      subject = Result.new('1-2 Test')
      assert_equal('1-2', subject.roll)
    end

    it 'defines @desc' do
      subject = Result.new('1-2 Test')
      assert_equal('Test', subject.description)
    end

    it 'defines @low' do
      subject = Result.new('1-2 Test')
      assert_equal(1, subject.low)
    end

    it 'defines @high' do
      subject = Result.new('1-2 Test')
      assert_equal(2, subject.high)
    end
  end

  describe '#hit?' do
    describe 'for range' do
      it 'returns true when roll between high and low' do
        subject = Result.new('10-20 Test')
        assert(subject.hit?(15))
      end

      it 'returns false when roll above high and low' do
        subject = Result.new('10-20 Test')
        refute(subject.hit?(35))
      end

      it 'returns false when roll below high and low' do
        subject = Result.new('10-20 Test')
        refute(subject.hit?(5))
      end
    end

    describe 'for number' do
      it 'returns true when roll matches' do
        subject = Result.new('10 Test')
        assert(subject.hit?(10))
      end

      it 'returns false when roll above high and low' do
        subject = Result.new('10 Test')
        refute(subject.hit?(35))
      end

      it 'returns false when roll below high and low' do
        subject = Result.new('10 Test')
        refute(subject.hit?(5))
      end
    end
  end
end

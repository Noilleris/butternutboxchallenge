require 'minitest/spec'
require 'minitest/autorun'
require './formatter.rb'

class FormatterTest < Minitest::Test
  describe 'Formatter should be valid for' do
    it '07123456789' do
      assert_equal Formatter::PhoneNumber::UK.format('07123456789'), '+447123456789'
    end

    it '447123456789' do
      assert_equal Formatter::PhoneNumber::UK.format('447123456789'), '+447123456789'
    end

    it '+447123456789' do
      assert_equal Formatter::PhoneNumber::UK.format('+447123456789'), '+447123456789'
    end

    it '07(123)456789' do
      assert_equal Formatter::PhoneNumber::UK.format('07(123)456789'), '+447123456789'
    end

    it '07 (123) 45 67 89' do
      assert_equal Formatter::PhoneNumber::UK.format('07 (123) 45 67 89'), '+447123456789'
    end

    it '+44-712-345-67-89' do
      assert_equal Formatter::PhoneNumber::UK.format('+44-712-345-67-89'), '+447123456789'
    end

    it '+44 (712)-345-6789' do
      assert_equal Formatter::PhoneNumber::UK.format('+44 (712)-345-6789'), '+447123456789'
    end
  end
end

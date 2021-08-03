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

  describe 'Formatter should be throw exception for' do
    it 'nil number' do
      assert_raises NilNumber do
        Formatter::PhoneNumber::UK.format(nil)
      end
    end

    it 'empty number' do
      assert_raises EmptyNumber do
        Formatter::PhoneNumber::UK.format('')
      end
    end

    it 'random string' do
      assert_raises NotANumber do
        Formatter::PhoneNumber::UK.format('abcdefghijk')
      end
    end

    it 'short number 0712345678' do
      assert_raises WrongLength do
        Formatter::PhoneNumber::UK.format('0712345678')
      end
    end

    it 'long number 071234567891011' do
      assert_raises WrongLength do
        Formatter::PhoneNumber::UK.format('071234567891011')
      end
    end

    it 'corrupted number 071234RR789' do
      assert_raises BadNumber do
        Formatter::PhoneNumber::UK.format('071234RR789')
      end
    end

    it 'number outside of the UK' do
      assert_raises WrongCountry do
        Formatter::PhoneNumber::UK.format('+7 (123) 456-78-90')
      end
    end
  end
end

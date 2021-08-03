module Formatter
  module PhoneNumber
    module Exceptions
      class NilNumber < StandardError
        def message
          'Number could not be nil'
        end
      end

      class EmptyNumber < StandardError
        def message
          'Number could not be nil'
        end
      end
    end

    module UK
      module Exceptions
        class BadNumber < StandardError
          def message
            'Number in wong format, should be ((0)|(44)|(+44))7XXXXXXXXX, brackets, hyphens and whitespaces allowed'
          end
        end
      end

      COUNTRY_CODE = '+44'.freeze
      NORMILIZE_REGEX = /(\()|(\))|(\-)|(\s)/i.freeze
      VALID_PREFIX_REGEX = /((^0)|(^\+?44))/.freeze
      VALID_NORMAL_NUMBER = /^(0|(\+?44))7[0-9]{9}$/.freeze

      def normalize(number)
        raise Formatter::PhoneNumber::Exceptions::NilNumber if number.nil?

        raise Formatter::PhoneNumber::Exceptions::EmptyNumber if number.empty?

        number.gsub(NORMILIZE_REGEX, '')
      end

      def validate(number)
        raise Formatter::PhoneNumber::UK::Exceptions::BadNumber if number !~ VALID_NORMAL_NUMBER

        number.gsub(VALID_PREFIX_REGEX, '')
      end

      def self.format(number)
        COUNTRY_CODE + validate(normalize(number))
      end

      module_function :normalize, :validate
    end
  end
end

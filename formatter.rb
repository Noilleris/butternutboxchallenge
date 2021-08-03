module Formatter
  module PhoneNumber
    module UK
      COUNTRY_CODE = '+44'.freeze

      def normalize(number)
        number.gsub(/(\()|(\))|(\-)|(\s)/i, '')
      end

      def validate(number)
        number.gsub(/((^0)|(^\+?44))/, '')
      end

      def self.format(number)
        COUNTRY_CODE + validate(normalize(number))
      end

      module_function :normalize, :validate
    end
  end
end
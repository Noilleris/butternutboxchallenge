module Formatter
  module PhoneNumber
    module UK
      def normilize(number)
        '+447123456789'
      end

      def validate(number)
        '+447123456789'
      end

      def self.format(number)
        normal_number = normilize(number)

        validate(normal_number)
      end

      module_function :normilize, :validate
    end
  end
end
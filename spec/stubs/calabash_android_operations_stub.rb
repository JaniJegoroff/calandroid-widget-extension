require 'calabash-android/operations'

# Stub for Calabash
module Calabash
  # Stub for Android
  module Android
    # Stub for Operations
    module Operations
      attr_accessor :ui_query
      attr_accessor :args
      attr_accessor :opts
      attr_accessor :response

      def query(uiquery, *args)
        @ui_query = uiquery
        @args = args
        @response = response
      end

      def flash(uiquery, *args)
        @ui_query = uiquery
        @args = args
      end

      def touch(uiquery, opts = {})
        @ui_query = uiquery
        @opts = opts
      end
    end
  end
end

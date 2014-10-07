module RuboCop
  module Formatter
    require 'perscribo'
    require 'rubocop/formatter/progress_formatter'
    
    class PerscriboFormatter < ProgressFormatter
      def initialize(*args)
        super(*args)
        @output.singleton_class.send(:prepend, ::Perscribo::IO)
        reset_label
      end

      def started(target_files)
        super
      end

      def file_finished(file, offenses)
        update_label?(offenses)
        super
      end

      def finished(inspected_files)
        super
        reset_label
      end

      private

      def reset_label(label = :info)
        @output.label = label
        @output.puts if label == :info
      end

      def update_label?(offenses)
        reset_label(offenses.any? ? :failure : :success)
      end
    end
  end
end

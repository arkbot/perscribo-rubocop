require 'perscribo/support/core/io'

require 'rubocop/formatter/progress_formatter'

module Perscribo
  module RuboCop
    class Formatter < ::RuboCop::Formatter::ProgressFormatter
      def initialize(*args)
        super(*args)
        @output = Support::Core::IO.hook!(@output, :info)
      end

      def started(target_files)
        super
      end

      def file_finished(file, offenses)
        update_level?(offenses)
        super
      end

      def finished(inspected_files)
        super
        reset_level
      end

      private

      def reset_level(level = :info)
        @output.level = level
        @output.puts if level == :info
      end

      def update_level?(offenses)
        reset_level(offenses.any? ? :failure : :success)
      end
    end
  end
end

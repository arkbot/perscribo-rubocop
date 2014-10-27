require 'perscribo/guard'

module Perscribo
  module Support
    module Guard
      module RuboCop
        REQ_PATH = File.expand_path('/../../rubocop/formatter.rb', __FILE__)
        OUT_PATH = "#{Dir.pwd}/tmp/perscribo_rubocop_#{ENV['RACK_ENV']}.log"
        DEFAULTS = {
          labels: [:info, :failure, :success],
          guard_opts: {
            all_on_start: false,
            cli: [
              "--require #{REQ_PATH}",
              '--format Perscribo::RuboCop::Formatter',
              "--out #{OUT_PATH}"
            ].join(' '),
            hide_stdout: true,
            notification: true
          },
          path: OUT_PATH,
          watcher_opts: { }
        }

        ::Perscribo::Guard.capture!(self)
      end
    end
  end
end

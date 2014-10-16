DEFAULT_RUBOCOP_RESULTS = "#{Dir.pwd}/tmp/perscribo_rubocop.log"
DEFAULT_RUBOCOP_CLI = [
  "--require #{File.dirname(__FILE__)}/../rubocop/perscribo_formatter.rb",
  '--format RuboCop::Formatter::PerscriboFormatter',
  "--out #{DEFAULT_RUBOCOP_RESULTS}"
]
DEFAULT_RUBOCOP_OPTS = {
  all_on_start: false,
  cli: "#{DEFAULT_RUBOCOP_CLI.join(' ')}",
  hide_stdout: true,
  notification: true
}
log_output('RuboCop', "./#{DEFAULT_RUBOCOP_RESULTS}", :info, :failure, :success)

require 'thor'
require_relative 'command/commands'

module TRL
  class CLI < Thor

    desc 'list', 'lists boards'
    method_option :boards, aliases: '-b'

    def list(args = nil)
      puts TRL::Command::List.new(args).execute
    end

  end
end

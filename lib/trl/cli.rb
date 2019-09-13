require 'thor'
require_relative 'command/commands'

module TRL
  class CLI < Thor

    desc 'list', 'lists boards'
    method_option :name, aliases: '-n'
    method_option :labels, aliases: '-l'
    method_option :description, aliases: '-d'

    def list(args = nil)
      puts TRL::Command::List.new(args, options).execute
    end

  end
end

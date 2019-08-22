require 'thor'

module TRL
  class Command < Thor

    desc 'list', 'lists boards'
    method_option :boards, aliases: '-b'

    def list
      puts 'test'
    end

  end
end
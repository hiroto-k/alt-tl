# frozen_string_literal: true

require_relative './commands'

Dir.glob(File.join(__dir__, './commands/**/*.rb')).each do |file|
  require file
end

module AltTL
  class Cli < Thor

    package_name 'alt-tl'

    no_commands do
      # Call command class.
      #
      # @param [Class] klass Sub class of AltTL::Commands::Command.
      def call_command(klass)
        command = klass.new(options, args)
        command.start
      rescue StandardError => e
        puts "ERROR : #{e.message}"
      end
    end

    desc 'console', 'alt-tl console.'
    def console
      call_command(AltTL::Commands::ConsoleCommand)
    end

    desc 'update', 'Update the alt-tl list.'
    option 'accounts', desc: 'Select accounts', type: :array, default: nil
    def update
      call_command(AltTL::Commands::UpdateCommand)
    end
  end
end

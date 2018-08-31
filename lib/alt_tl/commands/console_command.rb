# frozen_string_literal: true

module AltTL
  module Commands
    class ConsoleCommand < Command

      # Start console command.
      def start
        Pry.start
      end
    end
  end
end

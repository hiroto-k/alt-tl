# frozen_string_literal: true

module AltTL
  module Commands
    class ConsoleCommand < Command

      def start
        Pry.start
      end
    end
  end
end

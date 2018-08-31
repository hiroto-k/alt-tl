# frozen_string_literal: true

require_relative './alt_tl_config'
require_relative './cli'

module AltTL
  class Application

    # Argv
    #
    # @return [Array]
    attr_reader :argv

    # Initialize Application.
    #
    # @param [Array] argv
    def initialize(argv)
      @argv = argv
    end

    # Start the application.
    def start
      raise 'Argv is empty.' if @argv.nil?

      AltTLConfig.from_hash(config_hash.with_indifferent_access)

      Cli.start(@argv)
    end

    private

    # Load config from file.
    def config_hash
      YAML.load_file(config_file)
    end

    # Return config file path.
    def config_file
      File.expand_path('./../../config/config.yml', __dir__)
    end
  end
end

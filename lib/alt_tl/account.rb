# frozen_string_literal: true

module AltTL
  class Account

    TWITTER_KEYS = [:consumer_key, :consumer_secret, :access_token, :access_token_secret].freeze

    # Account attribute.
    #
    # @return [Hash]
    attr_reader :account

    # Initialize account.
    #
    # @param [Hash] account Account attribute.
    def initialize(account)
      @account = account.with_indifferent_access

      validate_account
    end

    # Return account name.
    #
    # @return [String]
    def name
      account[:name]
    end

    # Return consumer_key.
    #
    # @return [String]
    def consumer_key
      account[:consumer_key]
    end

    # Return consumer_secret.
    #
    # @return [String]
    def consumer_secret
      account[:consumer_secret]
    end

    # Return access_token.
    #
    # @return [String]
    def access_token
      account[:access_token]
    end

    # Return access_token_secret.
    #
    # @return [String]
    def access_token_secret
      account[:access_token_secret]
    end

    # Return list_id
    #
    # @return [Integer]
    def list_id
      account[:list_id].to_i
    end

    # Return client class.
    #
    # @return [Twitter::REST::Client]
    def client
      @client ||= create_twitter_client
    end

    # Array access.
    #
    # @return [Object]
    def [](key)
      account[key]
    end

    private

    # Validate the account attribute.
    def validate_account
      raise 'Account name property is missing.' unless account.key?(:name)

      [TWITTER_KEYS, :list_id].flatten.each do |key|
        raise "Missing the \"#{key}\" property in account \"#{account[:name]}\"" unless account.key?(key)
      end
    end

    # Create twitter client class.
    #
    # @return [Twitter::REST::Client]
    def create_twitter_client
      config = account.slice(*TWITTER_KEYS)
      Twitter::REST::Client.new(config)
    end
  end
end

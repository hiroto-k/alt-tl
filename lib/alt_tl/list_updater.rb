# frozen_string_literal: true

require_relative './account'

module AltTL
  class ListUpdater

    # Account instance.
    #
    # @return [AltTL::Account]
    attr_reader :account

    # Initialize account.
    #
    # @param [AltTL::Account] account Account instance.
    def initialize(account)
      @account = account
    end

    # Run list update
    def update
      members = pull_current_member_ids
      friends = pull_current_friend_ids
      add_ids = friends - members
      remove_ids = members - friends

      if add_ids.empty? && remove_ids.empty?
        puts 'Nothing to updates.'
        return
      end

      add_to_list(add_ids) unless add_ids.empty?
      remove_from_list(remove_ids) unless remove_ids.empty?
    end

    private

    # Return client.
    #
    # @return [Twitter::REST::Client]
    def client
      account.client
    end

    # Return list id.
    #
    # @return [Integer]
    def list_id
      account.list_id
    end

    # Get current list member ids.
    #
    # @return [Array]
    def pull_current_member_ids
      client
        .list_members(list_id, count: 5000)
        .attrs[:users]
        .map do |user|
          user[:id]
        end
    end

    # Get current friend ids.
    #
    # @return [Array]
    def pull_current_friend_ids
      client
        .friend_ids(count: 5000)
        .attrs[:ids]
    end

    # Add to list.
    #
    # @param [Array] user_ids
    def add_to_list(user_ids)
      puts 'Adds'
      puts user_ids.join(', ')

      user_ids.each_slice(50) do |ids|
        client.add_list_members(list_id, ids)
      end

    rescue StandardError => e
      pp e
    end

    # Remove from list.
    #
    # @param [Array] user_ids
    def remove_from_list(user_ids)
      puts 'Removes'
      puts user_ids.join(', ')

      user_ids.each_slice(50) do |ids|
        client.remove_list_members(list_id, ids)
      end

    rescue StandardError => e
      pp e
    end
  end
end

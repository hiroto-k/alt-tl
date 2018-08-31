# frozen_string_literal: true

require_relative '../account'
require_relative '../list_updater'

module AltTL
  module Commands
    class UpdateCommand < Command

      # Start update command.
      def start
        accounts.each do |account_attributes|
          account = AltTL::Account.new(account_attributes)

          puts "Update #{account.name}."
          update(account)
          puts "Successfully updated #{account.name}!"
        end
      end

      private

      # Get accounts
      #
      # @return [Array]
      def accounts
        options[:accounts].nil? ? config.accounts : select_accounts_from_names(options[:accounts])
      end

      # Select the accounts from names.
      #
      # @param [Array] names Account names
      # @return [Array]
      def select_accounts_from_names(names)
        names.uniq!

        found_accounts = config.accounts.select do |account|
          names.include?(account[:name])
        end

        missing_accounts(names, found_accounts) unless names.length == found_accounts.length

        found_accounts
      end

      # Raise missing account error.
      #
      # @param [Array] names
      # @param [Array] found_accounts
      def missing_accounts(names, found_accounts)
        account_names = found_accounts.map do |account|
          account[:name]
        end
        missing_accounts = (names - account_names).join(', ')

        raise "Can not find the \"#{missing_accounts}\" accounts."
      end

      # Run update
      #
      # @param [AltTL::Account] account
      def update(account)
        list_updater = AltTL::ListUpdater.new(account)
        list_updater.update
      end
    end
  end
end

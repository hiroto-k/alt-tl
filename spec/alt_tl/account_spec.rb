# frozen_string_literal: true

require 'alt_tl/account'

describe AltTL::Account do
  let(:valid_attribute) do
    {
      name: 'hoge-name',
      consumer_key: 'hoge-ck',
      consumer_secret: 'hoge-cs',
      access_token: 'hoge-at',
      access_token_secret: 'hoge-ats',
      list_id: 123_456,
    }
  end

  describe '#initialize' do
    let(:missing_name_attribute) do
      {
        consumer_key: '',
        consumer_secret: '',
        access_token: '',
        access_token_secret: '',
        list_id: '',
      }
    end

    let(:missing_consumer_key_attribute) do
      {
        name: '',
        consumer_secret: '',
        access_token: '',
        access_token_secret: '',
        list_id: '',
      }
    end

    let(:missing_list_id_attribute) do
      {
        name: '',
        consumer_key: '',
        consumer_secret: '',
        access_token: '',
        access_token_secret: '',
      }
    end

    context 'valid attribute' do
      it 'return instance' do
        expect(AltTL::Account.new(valid_attribute)).to be_a AltTL::Account
      end
    end

    context 'empty attribute' do
      it 'raise error' do
        expect { AltTL::Account.new({}) }.to raise_error RuntimeError
      end
    end

    context 'missing name attribute' do
      it 'raise error' do
        expect { AltTL::Account.new(missing_name_attribute) }.to raise_error RuntimeError
      end
    end

    context 'missing consumer_key attribute' do
      it 'raise error' do
        expect { AltTL::Account.new(missing_consumer_key_attribute) }.to raise_error RuntimeError
      end
    end

    context 'missing list_id attribute' do
      it 'raise error' do
        expect { AltTL::Account.new(missing_list_id_attribute) }.to raise_error RuntimeError
      end
    end
  end

  describe '#name' do
    it 'return hoge-name' do
      expect(AltTL::Account.new(valid_attribute).name).to eq 'hoge-name'
    end
  end

  describe '#consumer_key' do
    it 'return hoge-ck' do
      expect(AltTL::Account.new(valid_attribute).consumer_key).to eq 'hoge-ck'
    end
  end

  describe '#consumer_secret' do
    it 'return hoge-cs' do
      expect(AltTL::Account.new(valid_attribute).consumer_secret).to eq 'hoge-cs'
    end
  end

  describe '#access_token' do
    it 'return hoge-at' do
      expect(AltTL::Account.new(valid_attribute).access_token).to eq 'hoge-at'
    end
  end

  describe '#access_token_secret' do
    it 'return hoge-ats' do
      expect(AltTL::Account.new(valid_attribute).access_token_secret).to eq 'hoge-ats'
    end
  end

  describe '#list_id' do
    it 'return 123456' do
      expect(AltTL::Account.new(valid_attribute).list_id).to eq 123_456
    end
  end
end

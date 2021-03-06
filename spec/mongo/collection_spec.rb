require 'spec_helper'

describe Mongo::Collection do

  describe '#==' do

    let(:client) { Mongo::Client.new(['127.0.0.1:27017'], :database => TEST_DB) }
    let(:database) { Mongo::Database.new(client, :test) }
    let(:collection) { described_class.new(database, :users) }

    context 'when the names are the same' do

      context 'when the databases are the same' do

        let(:other) { described_class.new(database, :users) }

        it 'returns true' do
          expect(collection).to eq(other)
        end
      end

      context 'when the databases are not the same' do

        let(:other_db) { Mongo::Database.new(client, :testing) }
        let(:other) { described_class.new(other_db, :users) }

        it 'returns false' do
          expect(collection).to_not eq(other)
        end
      end
    end

    context 'when the names are not the same' do

      let(:other) { described_class.new(database, :sounds) }

      it 'returns false' do
        expect(collection).to_not eq(other)
      end
    end

    context 'when the object is not a collection' do

      it 'returns false' do
        expect(collection).to_not eq('test')
      end
    end
  end

  describe '#insert' do

    let(:client) do
      Mongo::Client.new([ '127.0.0.1:27017' ], database: TEST_DB)
    end

    let(:collection) do
      client[:users]
    end

    before do
      client.cluster.scan!
    end

    context 'when providing a single document' do

      let(:result) do
        collection.insert({ name: 'testing' })
      end

      it 'does not error' do
        expect(result['ok']).to eq(1)
      end

      it 'inserts the document into the collection' do
        expect(result['n']).to eq(1)
      end
    end

    context 'when providing multiple documents' do

      let(:result) do
        collection.insert([{ name: 'test1' }, { name: 'test2' }])
      end

      it 'does not error' do
        expect(result['ok']).to eq(1)
      end

      it 'inserts the documents into the collection' do
        expect(result['n']).to eq(2)
      end
    end
  end
end

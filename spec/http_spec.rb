# frozen_string_literal: true

require 'rubybrainz/http'
require 'rubybrainz/entities/response'

RSpec.describe Rubybrainz::Http do
  client = described_class.new

  describe '#get' do
    subject { client.get(url: url, query: query) }

    context 'when given a basic artist request' do
      let(:url) { Rubybrainz::Constants::Urls::ARTIST_URL }
      let(:query) { 'artist:Madeon AND country:FR AND type:Person' }

      it 'returns a rubybrainz response' do
        VCR.use_cassette('madon_artist_search') do
          expect(subject).to be_a(Rubybrainz::Entities::Response)
        end
      end
    end
  end
end

# frozen_string_literal: true

require 'rubybrainz/search'
require 'rubybrainz/entities/request/artist_parameter'
require 'rubybrainz/entities/response'

RSpec.describe Rubybrainz::Search do
  search = described_class.new

  describe '#artist' do
    subject { search.artist(artist_parameter: artist_parameter) }

    let(:artist_parameter) do
      Rubybrainz::Entities::Request::ArtistParameter.new(
        artist: 'Madeon',
        country: 'FR',
        type: 'Person'
      )
    end

    it 'returns a valid rubybrainz response with the artist field filled', :aggregate_failures do
      VCR.use_cassette('madeon_artist_search') do
        expect(subject.success).to eq(true)
        expect(subject.message).to eq('OK')
        expect(subject.created).to eq('2020-11-24T20:28:24.345Z')
        expect(subject.count).to eq(1)
        expect(subject.offset).to eq(0)
      end
    end
  end
end

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

    it 'returns a rubybrainz response' do
      VCR.use_cassette('madeon_artist_search') do
        expect(subject).to be_a(Rubybrainz::Entities::Response)
      end
    end
  end
end

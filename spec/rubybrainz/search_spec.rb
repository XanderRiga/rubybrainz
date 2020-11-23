# frozen_string_literal: true

require 'rubybrainz/search'
require 'rubybrainz/entities/request/artist_parameter'

RSpec.describe Rubybrainz::Search do
  described_class = Rubybrainz::Search.new

  describe '#artist' do
    subject { described_class.artist(artist_parameter: artist_parameter) }

    let(:artist_parameter) do
      Rubybrainz::Entities::Request::ArtistParameter.new(
        artist: 'Madeon',
        country: 'FR',
        type: 'Person'
      )
    end

    it 'returns a faraday response with' do
      expect(subject).to be_a(Faraday::Response)
    end
  end
end

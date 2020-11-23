# frozen_string_literal: true

require 'rubybrainz/entities/request/artist_parameter'

RSpec.describe Rubybrainz::Entities::Request::ArtistParameter do
  described_class = Rubybrainz::Entities::Request::ArtistParameter

  context 'when instantiate with nothing' do
    subject { described_class.new }

    it 'builds an instance with all nil' do
      expect(subject).to be_a(Rubybrainz::Entities::Request::ArtistParameter)
    end
  end

  describe '#query_string' do
    subject { described_class.new(artist: 'Madeon', country: 'FR', type: 'Person').query_string }

    it 'builds a usable query string' do
      expect(subject).to eq('artist:Madeon AND country:FR AND type:Person')
    end
  end
end

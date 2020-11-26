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
        expect(subject.works).to eq(nil)

        artist = subject.artists.first

        expect(artist.id).to eq('fa1de503-aba7-41fa-a1ed-371b3e87a717')
        expect(artist.name).to eq('Madeon')
        expect(artist.sort_name).to eq('Madeon')
        expect(artist.type).to eq('Person')
        expect(artist.type_id).to eq('b6e035f4-3ce9-331c-97df-83397230b0df')
        expect(artist.gender).to eq('male')
        expect(artist.country).to eq('FR')

        area = artist.area

        expect(area.id).to eq('08310658-51eb-3801-80de-5a0739207115')
        expect(area.type).to eq('Country')
        expect(area.type_id).to eq('06dd0ae4-8c74-30bb-b43d-95dcedf961de')
        expect(area.name).to eq('France')
        expect(area.sort_name).to eq('France')

        begin_area = artist.begin_area

        expect(begin_area.id).to eq('eedd8c4c-2d89-4cc1-bc3f-07b316c0ea59')
        expect(begin_area.type).to eq('City')
        expect(begin_area.type_id).to eq('6fd8f29a-3d0a-32fc-980d-ea697b69da78')
        expect(begin_area.name).to eq('Nantes')
        expect(begin_area.sort_name).to eq('Nantes')
      end
    end
  end
end

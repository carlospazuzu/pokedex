require 'rails_helper'

RSpec.describe VerifyPokemon, type: :service do
  context 'when an existing pokemon is passed as argument' do
    it 'returns true as response to a http status 200' do
      VCR.use_cassette('valid_pokemon') do
        result = described_class.call('pikachu')
        expect(result.success?).to be(true)
      end
    end
  end

  context 'when a non-existing pokemon is passed as argument' do
    it 'returns false as response to a http status 404' do
      VCR.use_cassette('invalid_pokemon') do
        result = described_class.call('belzebu')
        expect(result.failure?).to be(true)
      end
    end
  end
end

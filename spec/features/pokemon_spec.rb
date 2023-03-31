require 'rails_helper'

describe 'the pokemon registration process', type: :feature do
  context 'when entering a non-existent pokemon' do
    it 'renders an error message' do
      VCR.use_cassette('feature/wrong_pokemon') do
        visit '/pokemons/new'

        fill_in 'pokemon_name', with: 'chupa_cabra'
        click_on 'Create Pokemon'

        expect(page).to have_content("Couldn't find pokemon!")
      end
    end
  end

  context 'when entering an existing pokemon' do
    it 'redirects to index page' do
      VCR.use_cassette('feature/correct_pokemon') do
        visit '/pokemons/new'

        fill_in 'pokemon_name', with: 'scyther'
        click_on 'Create Pokemon'

        expect(page).to have_content('Pokemons')
      end
    end
  end
end

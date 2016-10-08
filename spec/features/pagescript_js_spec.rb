require 'rails_helper'

RSpec.describe 'Pagescript integration', js: true do
  # scenario 'should not have JavaScript errors', js: true do
  #   visit '/haikus'
  #   expect(page).to_not have_errors
  # end
  scenario 'visiting the index' do
    visit '/haikus'
    expect(page).to have_content 'pagescript:haikus#index'
    expect(page).to have_content 'pagescript:haikus'
    expect(page).to have_content 'pagescript:#index'
  end

  scenario 'visiting show page' do
    visit '/haikus/1'
    expect(page).to have_content 'pagescript:haikus#show'
    expect(page).to have_content 'pagescript:haikus'
    expect(page).to have_content 'pagescript:#show'
  end
end

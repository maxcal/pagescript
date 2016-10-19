require 'rails_helper'
require 'json'

RSpec.describe 'Pagescript integration', js: true do

  let(:json) do
    JSON.parse( page.first('#test').text )
  end

  scenario 'visiting the index' do
    visit '/haikus'
    expect(page).to have_content 'pagescript:haikus#index'
    expect(page).to have_content 'pagescript:haikus#*'
    expect(page).to have_content 'pagescript:*#index'
    expect( json ).to include(
      "controller" => "haikus",
      "action"     => "index"
    )
  end

  scenario 'visiting show page' do
    visit '/haikus/99?' + { "foo-bar-baz" => true }.to_param
    expect(page).to have_content 'pagescript:haikus#show'
    expect(page).to have_content 'pagescript:haikus#*'
    expect(page).to have_content 'pagescript:*#show'
    expect( json ).to include(
      "controller" => "haikus",
      "action"     => "show"
    )
    expect( json["params"] ).to include(
      "id" => 99,
      "fooBarBaz" => true
    )
  end
end

require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the index path', {:type => :feature}) do
  it('displays an button to add words and a list of all saved words') do
    visit('/')
    expect(page).to have_content('Your Words')
    click_link('Add Word')
    expect(page).to have_content('Add a word:')
  end
end

describe('the add a word path', {:type => :feature}) do
  it('displays form to add a new word') do
    visit('/words/new')
    expect(page).to have_content('Add a word:')
    fill_in('word', :with => 'cat')
    click_button('Add')
    expect(page).to have_content('Thank you! Your word was added!')
  end
end

describe('the add a definition path', {:type => :feature}) do
  it('displays form to add a definition to a word') do
    visit('/words/new')
    expect(page).to have_content('Add a word:')
    fill_in('word', :with => 'cat')
    click_button('Add')
    expect(page).to have_content('Thank you! Your word was added!')
    click_link('Words')
    expect(page).to have_content('Your Words')
    click_link('cat', match: :first)
    expect(page).to have_content('cat')
    click_link('Add definition')
    expect(page).to have_content('Add a definition to cat')
    fill_in('definition', :with => 'a fluffy creature')
    click_button('Add')
    expect(page).to have_content("Thank you! Your definition was added!")
  end
end

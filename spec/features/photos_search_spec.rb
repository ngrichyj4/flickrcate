require 'integration_spec_helper'
require 'rails_helper'

describe "app/controllers/photos_controller.rb", js: true do
  context "with keyword" do
    let(:keyword)  { build :keywords }
    
    it "should return results" do
    	visit root_url
    	fill_in 'keyword', with: keyword[:item]
    	click_button "Search"
    	wait_for_ajax
    	expect( all('div.photo').count ).to be < 13
    end

    it "should return more results" do 
    	visit root_url
    	fill_in 'keyword', with: keyword[:item]
    	click_button "Search"
    	wait_for_ajax
    	page.execute_script "window.scrollBy(0, $('.results').height())" # scroll to bottom
    	wait_for_ajax; sleep 1
    	page.execute_script "window.scrollBy(0, $('.results').height())" # scroll to bottom
    	wait_for_ajax; sleep 1
    	expect( all('div.photo').count ).to be > 13
    end
  end
end
require 'rails_helper'

RSpec.describe "LandingPages", type: :system do
  describe "App Home Page" do
    it "responds with success" do
      visit root_path
      expect(page).to have_content("TiakMuGaaw")
    end
  end
end

require 'rails_helper'

RSpec.describe "Analyses", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
  end

end

require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
let (:advertisements) do
  Advertisement.create(
  id: 1
  title: "This is a test",
  body: "This is a body test",
  price: 99
  )
end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end


end

require 'rails_helper'

RSpec.describe "Usersコントローラーのテスト", type: :request do
  context "ユーザー認証に関して" do
    let(:user) { create(:user) }

    it "ユーザー認証が成功する" do
      sign_in user
      expect(response.status).to eq 200
    end
  end
end

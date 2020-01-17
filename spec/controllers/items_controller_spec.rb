require 'rails_helper'

describe ItemsController do
  let(:user) {create(:user)}

  describe ' GET #index ' do
    it "商品一覧ページ表示" do
      get :index
      expect(response).to render_template :index
    end

    it "インスタンス変数@itemsが期待した値か" do
      items = FactoryBot.create_list(:item, 10)
      get :index
      expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at })
    end
  end
end
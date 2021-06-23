require 'rails_helper'

RSpec.describe 'Spotモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { spot.valid? }

    let(:user) { create(:user) }
    let(:post) { build(:post, user_id: user.id) }
    let(:spot) { build(:spot, post_id: post.id) }

    context 'addressカラム' do
      it '空欄でないこと' do
        spot.address = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(Spot.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end
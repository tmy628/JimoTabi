require 'rails_helper'

RSpec.describe 'Commentモデルのテスト', type: :model do
describe 'バリデーションのテスト' do
    subject { comment.valid? }

    let(:user) { create(:user) }
    let(:post) { build(:post, user_id: user.id) }
    let(:comment) { build(:comment, post_id: post.id) }

    context 'contentカラム' do
      it '空欄でないこと' do
        comment.content = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end

    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end

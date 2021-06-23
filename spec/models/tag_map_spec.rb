require 'rails_helper'

RSpec.describe 'TagMapモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do

    let!(:user) { create(:user) }
    let!(:tag) { create(:tag) }
    let!(:post) { create(:post, user_id: user.id) }
    let(:tag_map) { create(:tag_map, post_id: post.id, tag_id: tag.id) }


    it "post_idとtag_idがある場合、有効であること" do
      expect(tag_map).to be_valid
    end

    it "post_idがない場合、無効であること" do
      tag_map.post_id = nil
      expect(tag_map).to be_invalid
    end

    it "tag_idがない場合、無効であること" do
      tag_map.tag_id = nil
      expect(tag_map).to be_invalid
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(TagMap.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end

    context 'Tagモデルとの関係' do
      it '1:Nとなっている' do
        expect(TagMap.reflect_on_association(:tag).macro).to eq :belongs_to
      end
    end
  end
end
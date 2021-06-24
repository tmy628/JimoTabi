require 'rails_helper'

RSpec.describe 'Tagモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { tag.valid? }

    let!(:other_tag) { create(:tag) }
    let(:tag) { create(:tag) }

    context 'tag_nameカラム' do
      it '一意性があること' do
        tag.tag_name = other_tag.tag_name
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'TagMapモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tag.reflect_on_association(:tag_maps).macro).to eq :has_many
      end
    end

    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tag.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
  end
end

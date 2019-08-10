require 'rails_helper'

describe 'Question' do
  describe '#valid?' do
    subject { build(:question, content: content) }

    shared_examples '検証エラーになる' do
      it { is_expected.to be_invalid }
    end

    shared_examples '検証エラーにならない' do
      it { is_expected.to be_valid }
    end

    context 'すべて適切な値が入っているとき' do
      let(:content) { 'テストコンテント' }

      it_behaves_like '検証エラーにならない'
    end

    context '重複するcontextが存在するとき' do
      let!(:question) { create(:question, content: 'テストコンテント') }
      let(:content) { 'テストコンテント' }

      it_behaves_like '検証エラーになる'
    end
  end
end

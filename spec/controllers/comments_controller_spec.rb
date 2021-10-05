require 'rails_helper'

describe CommentsController do
  describe 'POST #create' do
    context 'コメントを投稿できる場合' do
      it "contentがあれば投稿できる" do
        content = FactoryBot.build(:post)
        expect(content).to be_valid
      end
    end
  end
end

describe CommentsController do
  describe 'POST #create' do
    context 'コメントを投稿できない場合' do
      it "contentが空であると投稿できない" do
        comment = FactoryBot.build(:post, content: "")
        comment.valid?
        expect(comment.errors[:content]).to include("を入力してください")
      end
      it "user_idが無いと投稿できない" do
        comment = FactoryBot.build(:post, user_id: nil)
        comment.valid?
        expect(comment.errors[:user_id]).to include("を入力してください")
      end
    end
  end
end
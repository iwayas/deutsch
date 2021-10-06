require 'rails_helper'

describe PostsController do
  describe 'POST #new' do
    it "posts/new.html.erbに遷移すること" do
    end
  end
end

describe PostsController do
  describe 'POST #create' do
    context '質問を投稿できる場合' do
      it "contentがあれば投稿できる" do
        content = FactoryBot.build(:post)
        expect(content).to be_valid
      end
    end
  end
end

describe PostsController  do
  describe 'POST #create' do
    context '質問を投稿できない場合' do
      it "contentが空であると投稿できない" do
        post = FactoryBot.build(:post, content: "")
        post.valid?
        expect(post.errors[:content]).to include("を入力してください")
      end
      it "user_idが無いと投稿できない" do
        post = FactoryBot.build(:post, user_id: nil)
        post.valid?
        expect(post.errors[:user_id]).to include("を入力してください")
      end
    end
  end
end
require 'rails_helper'

RSpec.describe Novel, type: :model do
  let(:user) { User.create(nickname: "テスト", email: "test@example.com", password: "password", password_confirmation: "password") }

  before do
    @novel = Novel.new(
      title: "サンプルタイトル",
      content: "サンプル本文",
      expires_at: 1.day.from_now,
      user: user
    )
  end

  describe '小説投稿' do
    context '投稿できるとき' do
      it 'title, content, expires_at, userが存在すれば有効' do
        expect(@novel).to be_valid
      end
    end

    context '投稿できないとき' do
      it 'titleが空では投稿できない' do
        @novel.title = ''
        expect(@novel).to be_invalid
      end

      it 'contentが空では投稿できない' do
        @novel.content = ''
        expect(@novel).to be_invalid
      end

      it 'userが紐づいていなければ投稿できない' do
        @novel.user = nil
        expect(@novel).to be_invalid
      end
    end

    context '公開期限のバリデーション' do
      it '過去の時刻を指定した場合は保存時に24時間後に補正される' do
        past_time = 1.hour.ago
        @novel.expires_at = past_time
        @novel.save
        expect(@novel.expires_at).to be_within(1.second).of(24.hours.from_now)
      end
    end
  end
end
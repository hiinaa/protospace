require 'rails_helper'

describe Prototype do
  describe 'association' do
    context 'with comments' do
      it 'deletes the comments when prototype is deleted' do
        prototype = build(:prototype)
        comment = create(:comment, prototype: prototype)
        expect{ prototype.destroy }.to change{ Comment.count }
      end
    end

    context 'with likes'do
      it 'deletes the likes when prototype is deleted' do
        prototype = build(:prototype)
        like = create(:like, prototype: prototype)
        expect{ prototype.destroy }.to change{ Like.count }
      end
    end
  end


  describe 'validations' do
    context 'with valid attributes' do
      it 'has a valid factory' do
        expect(build(:prototype)).to be_valid
      end
    end

    context 'without valid attributes' do
      it 'is missing a title' do
        prototype = build(:prototype, title: nil)
        prototype.valid?
        expect(prototype.errors[:title]).to include("can't be blank")
      end
    end

    context 'catch_copy' do
      it 'is missing a catch_copy' do
        prototype = build(:prototype, catch_copy: nil)
        prototype.valid?
        expect(prototype.errors[:catch_copy]).to include("can't be blank")
      end
    end

    context 'concept' do
      it 'is missing a concept' do
        prototype = build(:prototype, concept: nil)
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
  end

  describe '#posted_date' do
    it 'returns dates in a specified format' do
      prototype = build(:prototype)
      expect(prototype).to be_valid
    end
  end

  describe '#is_liked_by_current_user?(user_id)' do
    context 'when liked by a user' do
      it 'returns true' do
        user = create(:user)
        prototype = create(:prototype, user: user)
        like = create(:like, prototype: prototype, user: user)
        expect(prototype.is_liked_by_current_user?(user)).to be_truthy
      end
    end

    context 'when not liked by a user' do
      it 'returns nil' do
        user = create(:user)
        another_user = create(:user)
        prototype = create(:prototype, user: another_user)
        like = create(:like, prototype: prototype, user: another_user)
        expect(prototype.is_liked_by_current_user?(user)).to be_falsey
      end
    end
  end
end

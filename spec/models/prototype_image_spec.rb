require 'rails_helper'

describe PrototypeImage do
  describe '#create' do
    context 'with valid attributes' do
      it 'has a valid factory' do
        image = build(:prototype_image, :main)
        expect(image).to be_valid
      end
    end

    context 'without content attributes' do
      it 'returns error' do
          image = PrototypeImage.new(image: nil)
          image.valid?
          expect(image.errors[:image]).not_to include("can't be blank")
      end
    end

    context 'without status attribute' do
      it 'returns error' do
        image = build(:prototype_image, status: nil)
        image.valid?
        expect(image.errors[:status]).not_to include("can't be blank")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should create a new product ' do
      category = Category.new(name: "Shrubs")
      product = Product.new({name: "Shrubby", price: 15, quantity: 20, category: category})

      expect(product.valid?).to eql(true) 
    end
    it 'should not create a new product without name peramiter' do
      category = Category.new(name: "Shrubs")
      product = Product.new({name: nil, price: 15, quantity: 20, category: category})
      product.valid?
      expect(product.errors[:name]).to include("can't be blank") 
    end
    # it "provides an error message when price is nil" do
    #   @category = Category.create(name: "Shrubs")
    #   @product = Product.create(name: "Shrubby", price: nil, quantity: 20, category: @category)
    #   puts @product.errors[:price]
    #   expect(@product.errors[:price]).to include("Price can't be blank")
    # end

    it 'should not create a new product without quantity peramiter' do
      @category = Category.new(name: "Shrubs")
      @product = Product.new({name: "Shrubby", price: 15, quantity: nil, category: @category})
      @product.valid?
      expect(@product.errors[:quantity]).to include("can't be blank")
    end
    it 'should not create a new product without category peramiter' do
      @product = Product.new({name: "Shrubby", price: 15, quantity: 20, category: nil})
      @product.valid?
      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end

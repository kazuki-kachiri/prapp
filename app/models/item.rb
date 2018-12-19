class Item < ApplicationRecord
  belongs_to :category
  belongs_to :Order, through: :Orderdetail
  validates :name, presence: true, length: { minimum: 1, message: 'Too short to name' }
  # default_scope { order(created_at: :asc)}

  scope :search, ->(parameter) do
    result = Item.order(created_at: asc)
    parameter.split.each do |search|
      result = result.where(['name Like ?',"%#{search}%"])
    end
    result
  end
end

#keywordおろしてきて
#words = keyword.split('')
#words.each do |word|

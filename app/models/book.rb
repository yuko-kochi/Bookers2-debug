class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(content,method)
	 if search == 'forword'
         @book = Book.where('title LIKE?', '#{method}%')
    elsif search == 'backword'
         @book = Book.where('title LIKE?', '%#{method}')
    elsif search == 'perfect'
         @book = Book.where('title: method')
    elsif search == 'partial'
         @book = Book.where('title LIKE?','%#{method}%')
    else
         @book = Book.all
    end
  end



end


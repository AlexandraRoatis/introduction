class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :stories
  has_many :guesses
         
  def number_of_stories
    stories.count
  end
  
  def number_of_guesses
    guesses.count
  end
  
  def correct_guesses
    count = 0
    guesses.each do |g|
      count += 1 if g.author == g.story.user
    end
    count
  end
  
  def points
    (number_of_stories * 5) + number_of_guesses + (correct_guesses * 10)
  end
end

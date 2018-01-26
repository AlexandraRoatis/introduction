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
  
  def interest_in_stories
    stories.joins(:guesses).count
  end
  
  def correct_guesses
    count = 0
    guesses.each do |g|
      count += 1 if g.author == g.story.user
    end
    count
  end
  
  def points
    (number_of_stories * 2) + number_of_guesses + interest_in_stories + (correct_guesses * 10)
  end
end

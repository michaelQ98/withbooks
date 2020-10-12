class Review < ApplicationRecord
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :review_text, presence: true

  def display_when_read
    {
      1 => '〜10代',
      2 => '20代',
      3 => '30代',
      4 => '40代',
      5 => '50代',
      6 => '60代'
    }[self.when_read]
  end
  def display_how_feel
    {
      1 => 'ワクワクする',
      2 => '切なくなる',
      3 => '誰かに会いたくなる',
      4 => '何かを始めたくなる',
      5 => '泣きたくなる',
      6 => 'すぐ再読したくなる',
      7 => '深く考えさせられる'
    }[self.how_feel]
  end
end

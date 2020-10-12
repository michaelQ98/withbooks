class HomeController < ApplicationController
  def top
    @admin_recom = Book.find_by(who_recommend: '0')
    @admin_recom = Book.order(updated_at: :desc).where(who_recommend: '0').limit(1)
    @media_recom = Book.order(updated_at: :desc).where(who_recommend: '1').limit(3)
    @user_recom= Book.order(updated_at: :desc).where(who_recommend: '2').limit(3)
  end
end

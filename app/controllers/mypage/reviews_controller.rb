class Mypage::ReviewsController < MypageController
  def index
  end

  def great
    render 'index'
  end

  def good
    render 'index'
  end
  
  def poor
    render 'index'
  end

  
  
end
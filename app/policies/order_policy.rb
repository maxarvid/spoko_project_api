class OrderPolicy
  attr_reader :user, :order

  def initialize(user, order)
    @user = user
    @post = order
  end

  def create?
    user.member? 
  end
end

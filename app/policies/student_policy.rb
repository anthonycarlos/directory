class StudentPolicy
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def index?
    false
  end

end

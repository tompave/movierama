class VoteNotifier
  def initialize(user, movie, vote)
    @user  = user
    @movie = movie
    @vote = vote
  end


  def send_notifications
    if email = @user.email.presence
    else
      false
    end
  end


  private

end

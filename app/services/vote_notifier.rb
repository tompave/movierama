class VoteNotifier
  def initialize(voter, movie, vote)
    @voter = voter
    @movie = movie
    @author = movie.user
    @vote = vote
  end


  def send_notifications
    if email = @author.email.presence
    else
      false
    end
  end


  private

end

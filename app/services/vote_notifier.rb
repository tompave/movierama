class VoteNotifier
  def initialize(voter, movie, vote)
    @voter = voter
    @movie = movie
    @vote = vote
  end


  def send_notifications
    if @movie.user.email.present?
      NotificationsMailer.movie_vote(@movie, @voter, @vote).deliver
    end
  end

end

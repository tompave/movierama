class NotificationsMailer < ActionMailer::Base
  default from: "notifications@movierama.dev"

  def movie_vote(movie, voter, vote)
    @movie  = movie
    @author = movie.user
    @voter  = voter
    @vote   = vote

    email = @author.email
    subject = vote_subject_for(@movie, @vote)

    mail(to: email, subject: subject) do |format|
      format.html
      format.text
    end
  end

  private

  def vote_subject_for(movie, vote)
    "'#{movie.title}' has been #{vote}d!"
  end
end

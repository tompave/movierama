require 'rails_helper'
require 'support/movie_helpers'

RSpec.describe NotificationsMailer do
  describe "#movie_vote" do
    setup_movie_and_users
    let(:vote) { :like }
    let(:mail) { NotificationsMailer.movie_vote(movie, voter, vote) }

    it "is sent to the right address" do
      expect(mail.to).to eql([author.email])
    end

    it "has the right subject" do
      expect(mail.subject).to eql("'#{movie.title}' has been #{vote}d!")
    end

    it "has the right body" do
      body = mail.body.encoded

      expect(body).to match("Hi #{author.name}")
      expect(body).to match(%Q{"#{movie.title}"})
      expect(body).to match("has been #{vote}d by")
      expect(body).to match("#{voter.name}</a>")
    end
  end
end

require 'rails_helper'
require 'support/movie_helpers'

RSpec.describe VoteNotifier do
  setup_movie_and_users

  let(:vote) { :like }
  subject { VoteNotifier.new(voter, movie, vote) }


  describe "#send_notifications" do
    context "when the user has an email address" do
      it "sends them an email notification" do
        pending "to be implemented"
        fail
      end
    end

    context "when the user does not have an email address" do
      it "does nothing" do
        pending "to be implemented"
        fail
      end
    end
  end
end

require 'rails_helper'
require 'support/movie_stubs'

RSpec.describe VoteNotifier do
  stub_movie_and_author

  let(:vote) { :like }
  subject { VoteNotifier.new(author, movie, vote) }


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

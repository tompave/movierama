require 'rails_helper'
require 'support/movie_stubs'

RSpec.describe VotingBooth do
  stub_movie_and_author

  describe "#vote" do
    describe "vote notifications" do
      let(:notifier_klass) { double('VoteNotifier') }
      let(:notifier) { double('VoteNotifier') }
      let(:vote_type) { :like }

      subject { VotingBooth.new(author, movie, notifier_klass) }

      it "uses the provided notifier to handle the user notification" do
        expect(notifier_klass).to receive(:new).with(author, movie, vote_type).and_return(notifier)
        expect(notifier).to receive(:send_notifications)
        subject.vote(vote_type)
      end
    end
  end

end

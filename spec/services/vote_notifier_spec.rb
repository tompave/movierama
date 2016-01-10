require 'rails_helper'

RSpec.describe VoteNotifier do
  let(:author) do
    User.create(
      uid:  'null|12345',
      name: 'Bob'
    )
  end


  let(:movie) do
    Movie.create(
      title:        'Empire strikes back',
      description:  'Who\'s scruffy-looking?',
      date:         '1980-05-21',
      user:         author
    )
  end

  before do
    movie # cause movie and author to come into existence 
  end


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

module RspecMovieHelpers
  def setup_movie_and_users
    let(:author) do
      User.create(
        uid:  'null|12345',
        name: 'Bob',
        email: 'bob@example.com'
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

    let(:voter) do
      User.create(
        uid:  'null|235235',
        name: 'John Doe',
        email: 'john.doe@example.com'
      )
    end

    before do
      movie # cause movie and author to come into existence 
    end
  end
end

RSpec.configure { |c| c.extend RspecMovieHelpers }

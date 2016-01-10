module RspecMovieStubs
  def stub_movie_and_author
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

    before do
      movie # cause movie and author to come into existence 
    end
  end
end

RSpec.configure { |c| c.extend RspecMovieStubs }

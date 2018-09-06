module Seeds
  class Seeder
    class << self

      NUM_AUDITORIA = 8

      def seed
        puts 'cleaning database...'
        clean_db
        puts 'creating auditoria and movies...'
        create_auditoria
        create_movies
        # create_showings
      end

      private

      def clean_db
        tables.each { |table| table.constantize.destroy_all }
      end

      def tables
        %w(Order Showing Movie Auditorium)
      end

      def create_auditoria
        auditoria_array = Array.new(NUM_AUDITORIA) do |n|
          {
            number: (n + 1),
            capacity: Faker::Number.number(2)
          }
        end
        @auditoria = Auditorium.create(auditoria_array)
      end

      def create_movies
        movies_array = [
          {
            title: 'Avatar',
            runtime: 162,
            description: 'Avatar',
            rating: 'PG-13'
          },
          {
            title: 'Captain America: Civil War',
            runtime: 148,
            description: 'Captain America',
            rating: 'PG-13'
          },
          {
            title: 'Ice Age',
            runtime: 103,
            description: 'Ice Age',
            rating: 'PG'
          },
        ]
        @movies = Movie.create(movies_array)
      end

      def create_showings
        dates = (Date.today..Date.today + 1.week)
        @auditoria.slice(3).each do |auditorium|
          @movies.each do |movie|
            showings = dates.map do |date|
              {
                showtime: (date.to_time + 14.hours),
                movie: movie,
                auditorium: auditorium,
              }
            end
            Showing.create(showings)
          end
        end
      end
    end
  end
end

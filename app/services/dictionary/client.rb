  # services/dictionary/client.rb
  module Dictionary
    class Client
      BASE_URL = "https://api.dictionaryapi.dev/api/v2/entries/en/"

      def get_definition(word)
        url = "#{BASE_URL}#{word}"
        definition = RestClient.get(url)
        JSON.parse(definition)

        # Отримуємо перший об'єкт визначення
      rescue StandardError => e
        puts "Error: #{e.message}"
      end
    end
  end

# services/dictionary/client.rb
module Dictionary
    class Client
      Base_URL = "https://api.dictionaryapi.dev/api/v2/entries/en/<word>"
    
      def get_definition(word)
        url = "#{Base_URL}/#{word}"
        definition = RestClient.get(url)
        JSON.parse(definition)
      rescue StandardError => e
        puts "Error: #{e.message}"
      end
    end
  end
  
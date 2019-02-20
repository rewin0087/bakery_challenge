module Representers
  class DisplayResult
    attr_reader :result

    def initialize(result)
      @result = result
    end

    def print
      puts "\n"
      puts "============================ RESULT =============================="
      puts "#{result[:quantity]} #{result[:code]} $#{result[:total]}"
      result[:packages].each do |package|
        puts "#{package[:count]} x #{package[:quantity]} $#{package[:price]}"
      end

      puts "============================= END ================================"
      puts "\n"
      puts "Please enter your order (e.g 10 VS5):"
    end
  end
end

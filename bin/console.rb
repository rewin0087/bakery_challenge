Dir['lib/**/*.rb'].each do |file|
  require File.join(File.dirname(__dir__), file)
end

puts "Please enter your order (e.g 10 VS5):"

ARGF.each_line do |line|
  begin
    request_order = BunOrder::ValidateRequest.parse_input(line)
    result = Backery.purchase_bun(*request_order)

    puts Representers::DisplayResult.new(result).print
  rescue StandardError => e
    puts "Invalid Order: #{e.class} #{e.message}"
  end
end
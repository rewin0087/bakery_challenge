module BunOrder
  class ValidateRequest
    InvalidRequestOrder ||= Class.new(StandardError)

    def self.parse_input(line)
      inputs = line.strip.split(' ')
      inputs[0] = inputs[0].to_i
      raise InvalidRequestOrder, line if inputs.count != 2
      inputs
    end
  end
end

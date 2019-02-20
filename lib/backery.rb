class Backery
  def self.purchase_bun(quantity, bun_code)
    BunOrder::Purchase.new.(quantity, bun_code)
  end
end

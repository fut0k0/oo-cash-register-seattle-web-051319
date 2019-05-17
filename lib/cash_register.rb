class CashRegister
	attr_accessor :total
	attr_reader :discount, :items
		
	def initialize(discount=0)
		@total = 0
		@discount = discount
		@items = []
	end
	
	def add_item(title, price, quantity=1)
		@previous = price * quantity
		@total += price * quantity
		while quantity > 0
			@items.push(title)
			quantity -= 1
		end
	end
	
	def apply_discount
		@total = @total * (1 - @discount.to_f / 100)
		if @discount == 0
			"There is no discount to apply."
		else
			"After the discount, the total comes to $#{@total.to_i}."
		end
	end
	
	def void_last_transaction
		@total -= @previous
	end
end
class Transfer
  # your code here
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    !!(@receiver.valid? && @sender.valid?)
  end

  def execute_transaction
    if @sender.balance >= @amount && self.valid? && self.status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount 
      return self.status = "complete" 
    else 
      self.status = "rejected"
      return p "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      self.status = "reversed"
    end
  end 
end

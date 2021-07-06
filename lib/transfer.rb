class Transfer
  attr_reader :amount
  attr_accessor :status, :sender, :receiver
  @@all = []
  def initialize(account1, account2, amount)
    @sender = account1
    @receiver = account2
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == 'pending' && self.valid? && self.sender.balance > amount
    sender.balance -= amount
    receiver.balance += amount
    @status = 'complete'
    else 
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      @status = 'reversed'
    end
  end
  def self.all
    @@all
  end
  # your code here
end

class BankAccount
    @@all = []
    attr_reader :name
    attr_accessor :balance, :status
    def initialize(name)
        @name = name
        @balance = 1000
        @status = 'open'
        @@all << self
    end
    def deposit(cash)
        @balance += cash
    end
    def display_balance
        "Your balance is $#{@balance}."
    end
    def  valid?
        self.status = 'closed'  if self.balance <= 0
        self.status == 'open'
    end
    def close_account
        @status = 'closed'
    end
end

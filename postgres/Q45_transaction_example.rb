# Transfers $amount from sender to receiver atomically.
def transfer_funds(sender, receiver, amount)
  ActiveRecord::Base.transaction do
    sender.balance -= amount
    sender.save!
    receiver.balance += amount
    receiver.save!
  end
end

# Example usage:
# transfer_funds(Account.find(1), Account.find(2), 100)

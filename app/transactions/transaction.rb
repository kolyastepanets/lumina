class Transaction
  attr_reader :subscriber_params, :subscriber

  def initialize(subscriber_params, subscriber)
    @subscriber_params = subscriber_params
    @subscriber = subscriber
  end
end

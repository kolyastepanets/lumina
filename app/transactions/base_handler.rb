class BaseHandler
  attr_reader :successor

  def initialize(successor = nil)
    @successor = successor
  end

  def call(transaction)
    return successor.call(transaction) unless can_handle?(transaction)

    handle(transaction)
  end

  def handle(_transaction)
    raise NotImplementedError, 'Each handler should respond to handle and can_handle? methods'
  end
end

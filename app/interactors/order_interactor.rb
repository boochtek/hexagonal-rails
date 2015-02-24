require "wisper"
require_relative "../models/order"


class OrderInteractor

  include Wisper.publisher

  def list
    orders = repository.all # Note that this will always return a (possibly empty) array-like list of orders.
    publish(:display, orders)
  end

  def get(id)
    order = repository.find(id)
    publish(:display, order)
  rescue ActiveRecord::RecordNotFound
    publish(:not_found, id)
  end

  def repository
    Order
  end

end

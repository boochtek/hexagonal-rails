require_relative 'app/interactors/order_interactor'


interactor = OrderInteractor.new


def display_order(order)
  puts "Order #{order.id}: $#{order.total}"
end


case ARGV.first
when "list"
  interactor.on(:display) { |orders| orders.each { |order| display_order(order) } }
  interactor.list
when "show"
  interactor.on(:display) { |order| display_order(order) }
  interactor.on(:not_found) { |order_id| puts "Could not find order #{order_id}" }
  interactor.get(ARGV[1].to_i)
else
  puts "Unknown subcommand"
  puts "Subcommands:"
  puts "  list"
  puts "  show <id>"
end



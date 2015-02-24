require "active_record/errors"


class Order < Struct.new(:id, :total)

  def self.all
    @all ||= [
      new(1, 120.00),
      new(2, 19.95),
      new(3, 17.77)
    ]
  end

  def self.find(id)
    result = all.select{ |order| order.id == id }.first
    raise ActiveRecord::RecordNotFound if result.nil?
    result
  end

end

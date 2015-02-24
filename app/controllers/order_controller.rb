class OrderController < ApplicationController

  def index
    interactor.on(:display) { |orders| render orders }
    interactor.list
  end

  def show
    interactor.on(:display) { |order| render order }
    interactor.on(:not_found) { |order_id| render status: 404 }
    interactor.get(params[:id])
  end

  def create
    interactor.on(:created) { |order| redirect_to order }
    interactor.set()
  end

  def update
    interactor.on(:updated) { |order| redirect_to order }
    interactor.on(:not_found) { |order_id| render status: 404 }
    interactor.set()
  end

private

  def interactor
    @interactor ||= OrderInteractor.new.tap do |interactor|
      interactor.subscribe(self)
    end
  end

end

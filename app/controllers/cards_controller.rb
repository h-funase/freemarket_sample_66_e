class CardsController < ApplicationController

  require "payjp"
  before_action :authenticate_user!
  before_action :card_exist, only: [:index,:pay,:destroy,:show,:confirmation,:complete]

  before_action :set_item, only: [:confirmation,:pay,:complete]


  def index
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  def new
    card = Card.where(user_id: current_user.id)
    if card.exists?
      redirect_to action: "show"
    else
      redirect_to action: "step4"
    end
  end  

  def step4
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      if card_params['payjp-token'].blank?
        redirect_to action: "step4"
      else
      customer = Payjp::Customer.create(card: card_params['payjp-token']) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card, token: params['payjp-token'])
        if @card.save
          redirect_to controller: '/signup', action: 'done'
        else
          redirect_to({action: "step4"}, notice: 'カード情報を入れ直してください')
        end
    end
  end

  def pay 
      if @item.status != 0  
        redirect_to item_path(@item.id) 
      else
        card = Card.find_by(user_id: current_user.id)
        Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
        Payjp::Charge.create(
        amount:  @item.price,
        customer: card.customer_id,
        currency: 'jpy',
        )
        @item[:status] = 1
        @item.save
        redirect_to action: 'complete'
      end
  end

  def destroy
       card = Card.find_by(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to mypage_card_path
  end
  
  def show 
    card_information
  end

  def confirmation
    @addresses = Address.find_by(user_id: current_user.id)
    card_information
  end

  def complete

    @addresses = Address.find_by(user_id: current_user.id)
    card_information
  end


  private

  def card_exist
    @card = Card.find_by(user_id: current_user.id)
    redirect_to action: "step4" if @card.blank?
  end

  def card_params
    params.permit('payjp-token',:item_id)
  end
  
  def card_information
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end


  def set_item
    @item = Item.find(params[:item_id])
  end

end
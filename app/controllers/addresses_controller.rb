class AddressesController < ApplicationController
  before_action :authenticate_user!

  def step3
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
    redirect_to controller: '/cards', action: 'step4'
    else
    render "step3"
    end
  end

  private
    def address_params
      params.require(:address).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :municipality, :prefectures, :street_number, :building_name).merge(user_id: current_user.id)
    end
end

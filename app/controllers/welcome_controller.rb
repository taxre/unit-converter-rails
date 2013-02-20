class WelcomeController < ApplicationController
  def convert
    @amount = params[:amount].to_f
    @from_unit = params[:from_unit].downcase
    @to_unit = params[:to_unit].downcase
    begin
      @converted = UnitConverter
        .convert(@amount, :"#{@from_unit}", :"#{@to_unit}")
    rescue UnitConverter::UnknownConversionError
      @error = "Sorry, I don't know how to convert #{@from_unit} to 
      #{@to_unit}."
    end
  end
end

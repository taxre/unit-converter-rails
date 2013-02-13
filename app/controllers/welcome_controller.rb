class WelcomeController < ApplicationController
 
  def convert
    amount = params[:unit_1].to_f
    from_unit = params[:unit_type_1]
    to_unit = params[:unit_type_2]
    begin
      @converted = UnitConverter
        .convert(amount, :"#{from_unit}", :"#{to_unit}")
    rescue UnkownConversionError
      @error = "Sorry, I don't know how to convert #{from_unit} to 
      #{to_unit}."
    end
  end
end

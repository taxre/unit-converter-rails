class WeightsController < ApplicationController
  def index
  end

  def convert
    method = :"#{params[:unit_type_1].downcase}_to_#{params[:unit_type_2].downcase}"
    begin
      @converted = UnitConverter::Weights.send(method, params[:unit_1].to_f)
    rescue NoMethodError
      @error = "Sorry, I don't know how to convert #{params[:unit_type_1]} to 
      #{params[:unit_type_2]}."
    end
  end
end

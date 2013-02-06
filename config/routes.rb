UnitConverterWebapp::Application.routes.draw do
  root :to => 'welcome#index'

  match "/distances" => "distances#index", :as => "distances"
  match "/distances/convert" => "distances#convert", :as => "convert_distance"

  match "/weights" => "weights#index", :as => "weights"
  match "/weights/convert" => "weights#convert", :as => "convert_weight"

end

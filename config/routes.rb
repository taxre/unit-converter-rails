UnitConverterWebapp::Application.routes.draw do
  root :to => 'welcome#index'

  match "/convert" => "welcome#convert", :as => "convert"
end

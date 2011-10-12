::Refinery::Application.routes.draw do
  resources :resource_guides, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :resource_guides, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :guide_authors, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :guide_authors, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end

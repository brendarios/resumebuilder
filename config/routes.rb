# Rails.application.routes.draw do
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#
#   root 'resumes#index'
# end


Rails.application.routes.draw do
  resources :people
  resources :resumes
    root 'home#index'

  get '/resumes/:id', to: 'resumes#show_pdf', as: 'resume_pdf'



end

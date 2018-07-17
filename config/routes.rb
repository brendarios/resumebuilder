# Rails.application.routes.draw do
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#
#   root 'resumes#index'
# end


Rails.application.routes.draw do

  resources :resumes
    root 'home#index'

  get '/resumes/:id', to: 'resumes#show_pdf', as: 'resume_pdf'

  get '/build-resume', to: 'resumes#sections', as: 'sections'

  get '/build-resume/contact_details', to: 'resumes#contact_details'

  patch '/build-resume/update_contact_details', to: 'resumes#update_contact_details'

  get '/build-resume/summary', to: 'resumes#summary'

  patch '/build-resume/update_summary', to: 'resumes#update_summary'

  get '/build-resume/education', to: 'resumes#education'

  post  '/build-resume/education', to: 'resumes#education'
  
  patch '/build-resume/update_education', to: 'resumes#update_education'

  get '/build-resume/experience', to: 'resumes#experience'

  patch '/build-resume/update_experience', to: 'resumes#update_experience'

  get '/build-resume/hobbies', to: 'resumes#hobbies'

  patch '/build-resume/update_hobbies', to: 'resumes#update_hobbies'

  get '/build-resume/others', to: 'resumes#others'

  patch '/build-resume/update_others', to: 'resumes#update_others'


  get '/build-resume/build', to: 'resumes#build_resume'



  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"

end

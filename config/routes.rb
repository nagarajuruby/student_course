Rails.application.routes.draw do
  resources :student_courses
  resources :courses
  resources :students

  root to: 'home#index'
end

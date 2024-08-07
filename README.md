# THINGS IN HERE

## GEMS

```
gem "sassc-rails"
gem 'haml'
gem 'simple_form'
gem 'bootstrap-sass'
```
- i didnt use bootstrap sass
- sass rails for .scss files
- haml instead of erb

## MODELS
- workouts
- exercises

## OTHER
- he did his own styling
- excercises belong to workouts

```
  resources :workouts do
    resources :exercises
  end
  root 'workouts#index'
end

```

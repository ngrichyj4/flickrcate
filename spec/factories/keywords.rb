FactoryGirl.define do
  factory :keywords, class:Hash do
    skip_create
    item ['COD', 'Family','Games','Movies','Models','Apple'].sample
    initialize_with { attributes }
  end
end


FactoryGirl.define do
  factory :answer do
    description "MyText"
    association :question, factory: :question, strategy: :build
  end

  factory :nil_answer, class: 'Answer' do
    description nil
    question
  end
end

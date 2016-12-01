FactoryGirl.define do
  factory :question do
    title "MyString"
    description "MyText"

    factory :question_with_answers do
      transient do
        count 2
      end

      after(:create) do |question, evaluator|
        create_list(:answer, evaluator.count, question: question)
      end
    end
  end

  factory :nil_question, class: 'Question' do
    title nil
    description nil
  end
end

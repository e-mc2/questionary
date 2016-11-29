FactoryGirl.define do
  factory :question do
    title "MyString"
    description "MyText"
  end

  factory :nil_question, class: 'Question' do
    title nil
    description nil
  end
end

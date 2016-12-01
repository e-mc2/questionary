require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:answer) { create(:answer) }
  let(:question) { create(:question_with_answers, count: 5) }

  describe 'GET #index' do
    before { get :index, params: {question_id: question} }

    it 'fills an array by new answers like question association' do
      expect(assigns :answers).to match_array(question.answers)
    end

    it 'renders the index template' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before { get :new, params: {question_id: question} }

    it 'creates a new answer' do
      expect(assigns :answer).to be_a_new(Answer)
    end

    it 'assigns an association with a parent question' do
      expect(assigns :question).to eq answer.question
    end

    it 'renders the new template' do
      expect(response).to render_template :new
    end
  end
  
  describe 'GET #show' do
    before { get :show, params: { question_id: question, id: answer } }

    it 'a requested question is assigned to @question' do
      expect(assigns :answer).to eq answer
    end
    
    it 'assigns an association with a parent question' do
      expect(assigns :question).to eq answer.question
    end

    it 'renders the show template' do
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    context 'with valid data' do
      it 'saves a new answer to the database' do
        expect { post :create,
                 params: { answer: attributes_for(:answer),
                           question_id: question } }
        .to change(Answer, :count).by(1)
      end

      it 'redirects to the show template' do
        post :create, params: { answer: attributes_for(:answer), question_id: question }
        expect(response).to redirect_to question_path(assigns(:answer))
      end
    end

    context 'with invalid data' do
      it 'does not save a new question to the database' do
        expect { post :create,
                 params: { answer: attributes_for(:nil_answer),
                           question_id: question } }
        .to_not change(Answer, :count)
      end

      it 're-redirects to the new template' do
        post :create, params: { answer: attributes_for(:nil_answer), question_id: question }
        expect(response).to render_template :new
      end
    end
  end

end

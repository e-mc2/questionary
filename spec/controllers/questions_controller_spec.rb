require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:question) { create(:question) }
  let(:questions) { create_list(:question, 2) }

  describe 'GET #index' do
    before { get :index }

    it 'fills an array by new questions' do
      expect(assigns :questions).to match_array(questions)
    end

    it 'renders the index template' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: question } }

    it 'a requested question is assigned to @question' do
      expect(assigns :question).to eq question
    end

    it 'renders the show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: question } }

    it 'a requested question is assigned to @question' do
      expect(assigns :question).to eq question
    end

    it 'renders the edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new question' do
      expect(assigns :question).to be_a_new(Question)
    end

    it 'renders the new template' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid data' do
      it 'saves a new question to the database' do
        expect { post :create, params: { question: attributes_for(:question) } }.to change(Question, :count).by(1)
      end

      it 'redirects to the show template' do
        post :create, params: { question: attributes_for(:question) }
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end

    context 'with invalid data' do
      it 'does not save a new question to the database' do
        expect { post :create, params: { question: attributes_for(:nil_question) } }.to_not change(Question, :count)
      end

      it 're-redirects to the new template' do
        post :create, params: { question: attributes_for(:nil_question) }
        expect(response).to render_template :new
      end
    end
  end
end

require('sinatra/activerecord')
require('./lib/question')
require('./lib/survey')
require('./lib/user')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  erb(:index)
end

get('/designer') do
  @surveys = Survey.all()
  erb(:designer)
end

post('/new_survey') do
  title = params.fetch("title")
  @new_survey = Survey.new({title: title})
  if @new_survey.save()
    survery_id = @new_survey.id()
    @question = Question.new(description: params.fetch("description"), survey_id: survery_id)
    @question2 = Question.new(description: params.fetch("description2"), survey_id: survery_id)
    @question3 = Question.new(description: params.fetch("description3"), survey_id: survery_id)
    @question4 = Question.new(description: params.fetch("description4"), survey_id: survery_id)
    @surveys = Survey.all()
    if @question.save() && @question2.save() && @question3.save() && @question4.save()
      erb(:designer)
    else
      @new_survey.delete()
      erb(:errors)
    end
  else
    erb(:errors)
  end
end

get('/survey/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  @questions = @survey.questions()
  erb(:survey_detail)
end

patch('/survey/:id') do
  id = params.fetch("id").to_i
  survey = Survey.find(id)
  questions = survey.questions()
  survey = survey.update(title: params.fetch("title"))
  @question = Question.find(params.fetch("id_1").to_i)
  @question.update(description: params.fetch("description"))
  @question2 = Question.find(params.fetch("id_2").to_i)
  @question2.update(description: params.fetch("description2"))
  @question3 = Question.find(params.fetch("id_3").to_i)
  @question3.update(description: params.fetch("description3"))
  @question4 = Question.find(params.fetch("id_4").to_i)
  @question4.update(description: params.fetch("description4"))
  @survey = Survey.find(id)
  @questions = @survey.questions.order(:id)
  erb(:survey_detail)
end

delete('/survey/:id') do
  survey = Survey.find(params.fetch("id").to_i)
  survey.questions.delete()
  survey.delete()
  @surveys = Survey.all()
  erb(:designer)
end

get('/survey/:id/user') do
  id = params.fetch("id").to_i
  @survey = Survey.find(id)
  @questions = @survey.questions
  erb(:take_survey)
end

post('/submit/survey') do
  @question1 = params.fetch("one", @question1)
  @question2 = params.fetch("two", @question2)
  @question3 = params.fetch("three", @question3)
  @question4 = params.fetch("four", @question4)
  @question5 = params.fetch("five", @question5)
  erb(:outcome)
end

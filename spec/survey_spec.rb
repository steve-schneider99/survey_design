require('spec_helper')

describe(Survey) do

  describe('#questions') do
    it('will return all questions associated with a list') do
      survey = Survey.create(title: "favorite things to do in Portland")
      question1 = Question.create(description: "What is your favorite brewery", survey_id: survey.id)
      question2 = Question.create(description: "Do you pump your own gas?", survey_id: survey.id)
      expect(survey.questions()).to(eq([question1, question2]))
    end
  end
end

require('spec_helper')

describe(Question) do

  describe('#survey') do
    it("will return survey from which the question comes") do
      survey = Survey.create(title: "Questions from Children")
      question = Question.create(description: "Where do babies come from?", survey_id: survey.id())
      expect(question.survey()).to(eq(survey))
    end
  end

    it("validates the presence of a description") do
      question = Question.create(description: "")
      expect(question.save()).to(eq(false))
    end
  

end

require('spec_helper')

describe(User) do

  describe('#survey') do
      it("returns the surveys one user has taken") do
        survey1 = Survey.create(title: "Books that make you Happy")
        survey2 = Survey.create(title: "Books that make you Sad")
        user1 = User.create(name: "Paul Walker", survey_id: survey1.id)
        expect(user1.survey).to(eq(survey1))
      end


  end
end

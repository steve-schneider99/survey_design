class CreateSurveysUsers < ActiveRecord::Migration
  def change
    create_table(:surveys_users) do |t|
      t.column(:survey_id, :integer)
      t.column(:user_id, :integer)
    end
  end
end

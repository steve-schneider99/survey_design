class Survey < ActiveRecord::Base

  has_many(:questions)
  has_many(:users)

  before_save(:capitalize_title)

  validates(:title, :presence => true)


private

    define_method(:capitalize_title) do
      self.title=(title().capitalize())
    end
end

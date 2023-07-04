class Quiz < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :questions
end

# == Schema Information
#
# Table name: quizzes
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

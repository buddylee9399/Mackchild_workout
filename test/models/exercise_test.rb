# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  name       :string
#  reps       :integer
#  sets       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  workout_id :integer          not null
#
# Indexes
#
#  index_exercises_on_workout_id  (workout_id)
#
# Foreign Keys
#
#  workout_id  (workout_id => workouts.id)
#
require "test_helper"

class ExerciseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
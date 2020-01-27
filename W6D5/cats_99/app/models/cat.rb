# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
    # include --> can use methods of module as instance methods
    # extend --> can use methods of module as class methods
    include ActionView::Helpers::DateHelper
    $COLORS = ['grey', 'black','white','pink'] # this equals %w(grey black white pink)
    validates :birth_date, :name, :sex, :description, presence: true
    validates :color, inclusion: { in: $COLORS,
    message: "Cats can't have that color" }

    def age
        self.distance_of_time_in_words(self.birth_date, Time.now)
        # :birth_date did not work
    end
end

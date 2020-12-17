class Enrollment < ApplicationRecord

    belongs_to :user,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :User

    

# select * from User where student_id = user_id

end

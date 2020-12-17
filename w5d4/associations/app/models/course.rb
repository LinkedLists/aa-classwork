class Course < ApplicationRecord

    has_many :enrollments,
        primary_key: :id,
        foreign_key: :id,
        class_name: :Enrollment

end

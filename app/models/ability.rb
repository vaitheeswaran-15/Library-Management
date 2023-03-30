# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(student)
    # signed students can read all the books
    can :read, Book, :all
    return unless student

    can :read_status, Book
    can :manage, Book, student_id: student.id
  end
end

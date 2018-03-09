module ApplicationHelper
  def options_for_users(users)
    options = []

    users.each do |user|
      options << [
        user.full_name,
        user.id
      ]
    end

    options
  end
end

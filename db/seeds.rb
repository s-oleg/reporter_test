# Roles
roles = %w(admin reporter)
roles.each { |name| Role.find_or_create_by_name(name) }

assert_raises NoExperienceError do
  employee.hire
end

# assert_raises checks if the given block raises an exception of the named type. If it does not, the assertion fails.
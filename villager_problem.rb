require File.expand_path('../finobacci.rb', __FILE__)

class VillagerProblem < Finobacci
  def death_people(age_of_death, year_of_death, person, hash_result)
    death = year_of_death.to_i - age_of_death.to_i
    if death.positive? && !hash_result[death].nil?
      p "Person #{person} born on Year = #{year_of_death.to_i} – #{age_of_death.to_i} = #{death}, number of people killed on year #{hash_result.key(hash_result[death])} is #{hash_result[death]}."
      return hash_result[death]
    else
      p "Not in a kill of year list or something contain negative value. Please try check again."
      return -1
    end
  end

  def average_death(sum_of_death, sum_of_person)
    average_val = sum_of_death.to_f / sum_of_person.to_f
    p "So the average is #{sum_of_death}/#{sum_of_person} = #{average_val}"
    return average_val
  end

  def user_input
    puts "How many years the witch killed a villager:"
    val = gets
    return p -1 if val.to_i.negative?
    result = calculate(val)

    puts "How many people who want to kill by the witch:"
    persons = gets
    return p -1 if persons.to_i.negative?
    sum_of_death = 0
    persons.to_i.times.each do |person|
      person += 1
      puts "Person #{person}"
      puts "Age of death?"
      age_death = gets
      puts "Year of Death?"
      year_death = gets
      death_ = death_people(age_death, year_death, person, result)
      return p -1 if death_.negative?
      sum_of_death += death_
    end

    average_death(sum_of_death, persons.to_i)
  end
end

person = VillagerProblem.new
person.user_input

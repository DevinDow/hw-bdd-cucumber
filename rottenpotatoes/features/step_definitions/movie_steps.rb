# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
    puts "'#{movie["title"]}' was successfully created."
  end
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  #puts
  #print "*** When I check ratings: uncheck="
  #print uncheck
  #print ", rating_list="
  #print rating_list
  #puts

  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  
  rating_list.split(%r{,\s*}).each do |rating|
    #puts rating
    checkbox = 'ratings_' + rating
    if (uncheck.nil?)
      check(checkbox)
    else
      uncheck(checkbox)
    end
  end
  #field_checked = find_field('ratings_PG')['checked']
  #puts
  #print "*** PG checked="
  #print field_checked
  #puts
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  # count rows <tr> in the HTML <table>
  rows = 1
  
  # count Movies in the DB
  movie_count = 0
  
  # check that they match
  expect(rows).to eq movie_count
end

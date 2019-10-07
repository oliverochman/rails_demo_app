Then("I would like to see {string}") do |content|
expect(page).to have_content content
end
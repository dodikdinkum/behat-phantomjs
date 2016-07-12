Feature: Search
	As a website user
	I need to be able to search for a word

Scenario: Searching for some words
	Given I am on "/search-result"
	When I fill in "s_word" with "hola"
		And I press "Search"
		Then I should see "Hilary Hahn"
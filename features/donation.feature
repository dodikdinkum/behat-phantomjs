Feature: Donation Process
	As a visitor I can donate some money

@javascript
Scenario: Donation Process
	Given I am on "/support/secure-donation"
	When I fill in "secure_donation_ammount" with "10" 
		And I press "Donate"
		Then I should see "Tax Deductible Donation"
	When I follow "Next Step"
		Then I should see "Please let us know any special needs or questions about your order."
	When I follow "Next Step"
		And I wait for 5 seconds
		And I should see "Billing and Shipping Information"
		And I fill in the following:
		# Billing
		| billing_first_name    | Era 						|
		| billing_last_name     | Prossesi  				|
		| billing_company       | Inspiro       			|
		| billing_email  		| era@gmail.com         	|
		| billing_phone         | 0217663504         		|
		| billing_address_1     | Jl. Gereja No. 9 Cilandak |
		| billing_address_2 	|          					|
		| billing_city          | Jakarta Selatan    		|
		| billing_postcode      | 12430         	 		|
		And I wait for 5 seconds
	When I switch to the iframe "braintree-hosted-field-number"
		And I fill in "credit-card-number" with "5555555555554444"
	When I switch to the main frame
		And I switch to the iframe "braintree-hosted-field-expirationDate"
		And I fill in "expiration" with "0718"
	When I switch to the main frame
		And I switch to the iframe "braintree-hosted-field-cvv"
		And I fill in "cvv" with "567"
	When I switch to the main frame
		And I press "Place order"
		And I wait for 30 seconds
		Then I should see "Thank You For Your Order!"
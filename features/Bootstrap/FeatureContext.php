<?php

namespace Features\Bootstrap;

use Assert\Assertion;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Behat\Hook\Scope\AfterScenarioScope;
use Behat\MinkExtension\Context\MinkContext;

class FeatureContext extends MinkContext implements SnippetAcceptingContext
{

    /**
     * @AfterScenario @javascript
     * @param AfterScenarioScope $scope
     */
    public function screenshotOnFailure(AfterScenarioScope $scope)
    {
        if ($scope->getTestResult()->isPassed() === false) {
            $imageData = $this->getSession()->getDriver()->getScreenshot();
            $imagePath = time() . '.png';
            file_put_contents($imagePath, $imageData);
        }
    }

    /**
     * @When /^I wait for (\d+) seconds$/
     * @And /^I wait for (\d+) seconds$/
     */
    public function iWaitForSeconds($seconds)
    {
        $this->getSession()->wait($seconds * 1000);
    }

    /**
     * @When /^I switch to the iframe "([^"]*)"$/
     * @And /^I switch to the iframe "([^"]*)"$/
     */
    public function iSwitchToIframe($arg1 = null)
    {
        $this->getSession()->switchToIFrame($arg1);
    }

    /**
     * @When I switch to the main frame
     * @And I switch to the main frame
     */
    public function iSwitchToMainFrame()
    {
        $this->getSession()->switchToIFrame();
    }
}


Uses: Processes

Feature: Http Connector
  Start chorus interpereter to publish some test suites into a chorus web agent, and then vaidate the
  xml and rss feeds supplied by the agent's http connector

  Scenario: Web Agent serves a main index
    And I start a chorusInterpreter process named sessionOne
    Then http://localhost:9080/ matches mainIndex.xml
    And  http://localhost:9080/index.xml matches mainIndex.xml


  Scenario: Web Agent serves a cache index
    And I start a chorusInterpreter process named sessionOne
    Then http://localhost:9080/Main+Cache/ matches cacheIndex.xml
    Then http://localhost:9080/Main+Cache/index.xml matches cacheIndex.xml

  Scenario: Check list all test suites from main cache
    And I start a chorusInterpreter process named sessionOne
    And I start a chorusInterpreter process named sessionTwo
    And I start a chorusInterpreter process named sessionThree
    Then http://localhost:9080/Main+Cache/allTestSuites.xml matches allTestSuites.xml
    Then http://localhost:9080/Main+Cache/allTestSuites.rss matches allTestSuitesRSS.xml

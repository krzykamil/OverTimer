# Overtime App

## Models:
  X Post -> date:DateTime, rationale:string
  X User -> using Devise gem
  X Admin -> using STI

## Features:
  -Approval Workflow
  -sending sms (with link to approval or overtime input)
  X Dashboard for admin
  -Emails summary for admin to approve
  -Needs to document if employee did not register overtime

## UI
  X Bootstrap -> formatting
  X Update styles for forms
  - Font Awesome Icons

## Refactor TODOS:
  X Add full_name to user
  -Refactor post x user associacion test
  -Refactor post date display in views, and tests for them
  -Add some integration tests for devise http://devise.plataformatec.com.br/#integration-tests

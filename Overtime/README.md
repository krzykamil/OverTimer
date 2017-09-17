# Overtime App

## Models:
  X Post -> date:DateTime, rationale:string
  X User -> using Devise gem
  X Admin -> using STI

## Features:
  -Workflow approval
  -sending sms (with link to approval or overtime input)
  -Dashboard for admin
  -Emails summary for admin to approve
  -Needs to document if employee did not register overtime

## UI
  X Bootstrap -> formatting

## Refactor TODOS:
  X Add full_name to user
  -Refactor post x user associacion test
  -Refactor post date display in views, and tests for them

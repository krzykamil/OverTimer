# Overtime App

## Models:
  X Post -> date:DateTime, rationale:string
  X User -> using Devise gem
  X Admin -> using STI
  - AuditLog

## Features:
  - Approval Workflow
  - sending sms (with link to approval or overtime input)
  X Dashboard for admin
  X Block non admin and users from logging
  - Emails summary for admin to approve
  - Needs to document if employee did not register overtime

## UI
  X Bootstrap -> formatting
  X Update styles for forms
  X Glyphicon Icons

## Refactor TODOS:
  X Add full_name to user
  X Refactor post x user associacion test
  X Refactor DRY code of searches in admin dashboard
  X Refactor post_form for admin user with status
  - Refactor post date display in views, and tests for them
  - Add some integration tests for devise http://devise.plataformatec.com.br/#integration-tests
  - Integrate validation for phone attr in user

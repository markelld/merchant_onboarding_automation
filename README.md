# README

# Merchant Onboarding Automation Pipeline

This project demonstrates an **automation pipeline that replaces a manual merchant onboarding workflow** commonly used in affiliate and adtech platforms.

Many affiliate networks onboard new merchants through a manual process that includes:

1. Receiving a merchant intake document  
2. Logging into a partner portal  
3. Creating an advertiser account  
4. Creating an offer tied to that advertiser  
5. Capturing generated IDs  
6. Creating an internal engineering task describing the integration  

This project automates that entire workflow using **Rails + Playwright browser automation**.

---

# Problem This Solves

At many affiliate platforms, onboarding a new advertiser requires operations staff to manually perform repetitive tasks.

Typical workflow:

Merchant submits onboarding form
↓
Ops logs into affiliate portal
↓
Create advertiser account
↓
Create offer
↓
Capture IDs
↓
Create engineering integration task 


This process is slow, error-prone, and difficult to scale.

This system automates the workflow.

---

# System Architecture

The automation pipeline orchestrates multiple steps:
Merchant Intake Document
↓
Google Doc Parsing + Validation
↓
Portal Automation (Playwright)
↓
Advertiser + Offer Creation
↓
ID Capture
↓
Integration Task Creation
↓
AutomationRun marked completed 


---

# Tech Stack

### Backend
- Ruby on Rails
- PostgreSQL
- Service objects for workflow orchestration

### Automation
- Playwright
- Node.js

### External Integrations
- Google Docs ingestion (stubbed for local demo)
- Asana task creation (currently stubbed)

---

# Key Components

## Merchant Intake

Represents the merchant onboarding document.

Fields parsed from the intake document:
Merchant Name
Website
Contact Name
Contact Email
Vertical
Country
Currency
Offer Name
Payout Type
Payout Amount
Tracking Method
Integration Notes 


The document is parsed and validated before automation begins.

---

# Portal Automation

Playwright automates the partner portal workflow.

Steps automated: 

Login to portal
↓
Create advertiser
↓
Capture advertiser ID
↓
Create offer
↓
Capture offer ID


Generated IDs are written to:
tmp/portal_result.json 


Example:


{
  "advertiser_external_id": "ADV-92981",
  "offer_external_id": "OFF-32299"
} 

AutomationRun

AutomationRun represents a full pipeline execution. 

It tracks: 
merchant_intake
advertiser
offer
integration_task
status
started_at
finished_at
error_message 

Example pipeline result:

status: completed
advertiser_id: ADV-92981
offer_id: OFF-32299
task_id: mock-task-8341 


Integration Task Creation

After advertiser and offer creation, the system creates an internal integration task.

This task represents the engineering work required to complete the merchant integration.

Task fields include:

Merchant Name
Advertiser ID
Offer ID
Tracking Method
Integration Notes

Currently this is stubbed and generates IDs such as:

mock-task-8341

This service can easily be swapped for the real Asana API.

Example Pipeline Execution
Merchant Intake Created
↓
Document Parsed
↓
Portal Automation Runs
↓
Advertiser Created
↓
Offer Created
↓
IDs Captured
↓
Integration Task Created
↓
AutomationRun Completed
Running the Project
Start Rails
rails server

Visit:

http://127.0.0.1:3000
Run Playwright Automation
npx playwright test playwright/portal_pipeline.spec.ts --headed

This will automatically:

login
create advertiser
create offer
capture IDs
Example Console Verification
run = AutomationRun.last

{
  status: run.status,
  advertiser: run.advertiser.advertiser_external_id,
  offer: run.offer.offer_external_id,
  task: run.integration_task.asana_task_gid
}

Example output:

{
 status: "completed",
 advertiser: "ADV-92981",
 offer: "OFF-32299",
 task: "mock-task-8341"
}
Future Improvements

Potential improvements include:

Real Asana Integration

Replace the stubbed integration task creator with:

POST https://app.asana.com/api/1.0/tasks
Google Docs Ingestion

Currently mocked.

Future versions could use:

google-apis-docs_v1
googleauth

to fetch intake documents directly.

Background Job Processing

Move pipeline execution to a worker system such as:

Sidekiq
GoodJob
Resque
Retry + Failure Handling

Track pipeline failures per stage:

validation_failed
portal_failed
asana_failed
Why This Project Is Interesting

This project demonstrates several real-world engineering patterns:

browser automation

workflow orchestration

external system automation

service-based architecture

operational tooling

These patterns are commonly used in:

affiliate platforms

adtech systems

internal automation tools

growth and operations automation pipelines
* ...

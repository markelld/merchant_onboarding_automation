# README 
# Merchant Onboarding Automation

Automates merchant onboarding by ingesting a Google Doc intake and performing portal setup through browser automation.

## Demo
[![Watch the demo](https://cdn.loom.com/sessions/thumbnails/da556993b1b74ae792cc10b8e84b1bfa-with-play.gif)](https://www.loom.com/share/da556993b1b74ae792cc10b8e84b1bfa)

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
---


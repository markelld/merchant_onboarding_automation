# README 
# Merchant Onboarding Automation

Automates merchant onboarding by ingesting a Google Doc intake and performing portal setup through browser automation.

## Demo

[![Watch the demo](https://cdn.loom.com/sessions/thumbnails/da556993b1b74ae792cc10b8e84b1bfa-with-play.gif)](https://www.loom.com/share/da556993b1b74ae792cc10b8e84b1bfa)

---

# Problem

Affiliate platforms frequently onboard new merchants through a manual operational workflow:

1. A merchant submits onboarding information through an intake document
2. Operations teams manually copy information into an affiliate portal
3. Advertiser and offer records are created manually
4. Generated IDs are copied into internal systems
5. A task is created for developers to implement tracking integrations

This process involves multiple systems and requires repetitive manual data entry.

---

# Solution

This system automates the merchant onboarding pipeline.

Instead of manually completing each step, the system:

- reads merchant onboarding data from a Google Doc
- parses structured merchant information
- automates portal setup using browser automation
- creates advertiser and offer records
- captures generated identifiers
- stores results in the database
- generates an integration task describing required tracking implementation

The pipeline converts a manual operations workflow into a reproducible automation process.

# Pipeline Flow  

Google Doc Intake
↓
Document Parsing
↓
Portal Automation
↓
Advertiser Creation
↓
Offer Creation
↓
Database Persistence
↓
Integration Task Generation 


---

# System Components

## Merchant Intake

A Google Doc contains structured onboarding information including:

- merchant name
- website
- contact information
- vertical
- payout model
- payout amount
- tracking method
- integration notes

The application accepts a Google Doc URL and initiates the automation pipeline.

---

## Document Ingestion

The system extracts structured fields from the intake document.

Responsibilities:

- extract the Google Doc ID
- ingest document content
- parse merchant fields
- validate required inputs
- store parsed values

Implementation:

- Ruby service objects
- structured text parsing
- ActiveRecord persistence

---

## Portal Automation

Browser automation logs into an internal affiliate portal and performs the onboarding workflow.

Automation steps:

1. login to portal
2. create advertiser record
3. capture advertiser ID
4. navigate to offer creation
5. create offer record
6. capture offer ID

Implementation:

- Playwright browser automation
- stable test selectors using `data-testid`
- automated form interaction

Example output:
Advertiser ID: ADV-65475
Offer ID: OFF-23723 


---

## Data Persistence

Generated identifiers are stored in the database to support downstream systems.

Stored data includes:

- advertiser ID
- offer ID
- merchant details
- pipeline run status
- integration task reference

Implementation:

- PostgreSQL
- ActiveRecord models
- service orchestration

---

## Integration Task Creation

Once onboarding is complete, the system generates an integration task describing what developers must implement.

Example task payload:
Merchant: Acme Supplements
Advertiser ID: ADV-65475
Offer ID: OFF-23723
Tracking Method: Postback
Integration Notes: Need pixel and postback support 


This simulates the creation of a task in systems such as:

- Asana
- Jira
- Linear

---

# Architecture 

Merchant Intake UI (Rails)
↓
Google Docs Ingestion Service
↓
Merchant Document Parser
↓
PortalAutomationRunner (Playwright)
↓
Advertiser + Offer Records
↓
Integration Task Creator
↓
Automation Run Result 


---

# Technologies Used

### Backend

- Ruby on Rails
- ActiveRecord
- PostgreSQL
- Service Object Architecture

### Automation

- Playwright
- browser automation
- headless browser execution
- stable UI selectors

### Data Processing

- structured document parsing
- JSON data exchange

### Development Tools

- Node.js
- npm
- Playwright test runner

---

# Key Features

### Document Ingestion
Accepts merchant onboarding data via a Google Doc URL.

### Workflow Automation
Automates a multi-system onboarding workflow.

### Browser Automation
Uses Playwright to interact with a simulated affiliate portal.

### Pipeline Orchestration
Coordinates ingestion, automation, persistence, and task creation.

### Operational Automation
Demonstrates how engineering teams can automate internal business processes.

---

---

# Future Improvements

Potential extensions include:

- direct Google Docs API ingestion
- real Asana API integration
- background job queue processing
- retry handling for automation failures
- pipeline monitoring and logging


---

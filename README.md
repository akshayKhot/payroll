# Payroll

Payroll is a payroll system API written in Ruby on Rails, to be consumed by a single-page application. 

It supports two endpoints:

1. `/api/upload` : Upon a `POST` request containing the time report file, save the data in the file to a database. 
2. `/api/report` : Upon a `GET` request, returns a JSON response summarizing the payroll report.

### Software Used
* Ruby version: **3.0.0p0**
* Rails version: **6.1.4**
* Database: **Sqlite**
* How to run the test suite: `rails test`
* How to run the application: `rails server`

---
### Usage

To test the API, an API client such as [Postman](https://www.postman.com/downloads/) is recommended.

1. Start the server: `rails server`
2. To upload the time report. 
   1. Set method type to `POST`.
   2. Set the URL to: [http://localhost:3000/api/payroll/upload](http://localhost:3000/api/payroll/upload)
   3. Select `File` from the drop-down under `Body > form-data`
   4. Select the CSV file. 
   5. Click 'Send'.
    

![](./public/upload.png)

3. To fetch the payroll report,
   1. Set method type to `GET`.
   2. Set the URL to: [http://localhost:3000/api/payroll/report](http://localhost:3000/api/payroll/report)
   3. Click 'Send'.
      

![](./public/report.png)

---

**How did you test that your implementation was correct?**

To ensure the accuracy, I used the following approaches:
- Manually verified the results for a few simple time report files
- Added automated unit tests for all the model classes
- Added controller tests that perform end-to-end testing to verify the results

**If this application was destined for a production environment, what would you add or change?**

For a production environment, I would
- perform a thorough quality assurance testing.
- review my code with other teammates as well the QA team.
- add more seed data and unit tests that cover the application logic for edge-cases and boundary conditions.
- test the `upload` endpoint with a few large time report files to ensure the api can process large files in a satisfactory amount of time, as well as the time taken to upload and build the report doesn't grow too much relative to the input file size.  
- perform load testing to make sure the app doesn't crash under heavy traffic.
- version the api, e.g. `/api/v1/upload` to gracefully handle the future api changes.

**What compromises did you have to make as a result of the time constraints of this challenge?**

I believe the domain logic could have been expressed in a better way to capture the essence of the business problem. However, here are some of the compromises I had to make due to time constraints
- Not having enough unit tests to test the boundary conditions.
- Not building a client that consumes the api and displays the results in a meaningful way.
- Not doing enough quality assurance, apart from basic testing. 


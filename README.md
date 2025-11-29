# 🚀 Postman API Testing Project

A professional API testing framework built with Postman Collections and Newman CLI for automated REST API validation. This project demonstrates industry-standard testing practices with comprehensive test coverage, detailed reporting, and CI/CD integration capabilities.

## 📋 Overview

This repository showcases a complete API testing solution that validates REST endpoints through automated test suites. The framework tests two popular public APIs with full CRUD operations, authentication flows, error handling, and performance validation.

**Key Highlights:**
- ✅ Production-ready test automation framework
- ✅ Comprehensive API validation (status codes, response schemas, performance)
- ✅ Professional HTML reporting with detailed insights
- ✅ Environment-based configuration management
- ✅ CI/CD pipeline integration support
- ✅ Zero setup complexity - works out of the box

## ✨ Features

- **Complete CRUD Testing**: Full lifecycle testing of REST endpoints (GET, POST, PUT, DELETE)
- **Authentication & Authorization**: Login flows, token management, and session handling
- **Response Validation**: Status codes, JSON schema validation, response time assertions
- **Error Handling**: Comprehensive negative testing and edge case validation
- **Dynamic Data Generation**: Runtime test data creation using pre-request scripts
- **Environment Management**: Configurable base URLs, variables, and test data
- **Professional Reporting**: Detailed HTML reports with request/response logs and performance metrics
- **Newman CLI Integration**: Command-line execution with multiple output formats

## 🌐 Public APIs Used

### 1. JSONPlaceholder API
**Base URL**: `https://jsonplaceholder.typicode.com`
- **Description**: Free fake REST API for testing and prototyping
- **Endpoints Tested**: Posts CRUD operations
- **Test Coverage**: Array validation, schema validation, performance testing, error handling

### 2. ReqRes API  
**Base URL**: `https://reqres.in/api`
- **Description**: Real API for testing HTTP requests with realistic responses
- **Endpoints Tested**: User management, authentication, pagination
- **Test Coverage**: Login flows, user CRUD, pagination handling, negative scenarios

## 📁 Project Structure

```
postman-api-testing-project/
│
├── collections/                           # Postman collection files
│   └── API_Testing_Framework.postman_collection.json
│
├── environments/                          # Environment configurations  
│   └── test_env.postman_environment.json
│
├── reports/                              # Generated HTML test reports
│   └── (auto-generated after test execution)
│
├── README.md                             # Project documentation
├── package.json                          # Node.js dependencies and scripts
└── .gitignore                           # Git ignore rules
```

**Folder Descriptions:**
- **`collections/`** - Contains Postman collection with all API tests, assertions, and pre-request scripts
- **`environments/`** - Environment variables including base URLs, authentication tokens, and dynamic test data
- **`reports/`** - Auto-generated HTML and JSON reports with detailed test results and performance metrics
- **`package.json`** - npm configuration with Newman dependency and test execution scripts

## 🛠️ Prerequisites

Before running the tests, ensure you have the following installed:

- **Node.js** (v14.0.0 or higher) - [Download here](https://nodejs.org/)
- **npm** (comes with Node.js) - Package manager for Node.js
- **Newman** (v6.0.0 or higher) - Postman CLI runner

**Optional:**
- **Postman Desktop App** - For editing collections and manual testing
- **Git** - For version control and cloning the repository

## 🚀 How to Run Tests

### Step 1: Clone and Setup
```bash
# Clone the repository
git clone https://github.com/rkshtjain3/postman-api-testing-project.git
cd postman-api-testing-project

# Install dependencies
npm install
```

### Step 2: Execute Tests
```bash
# Run tests with HTML report (recommended)
npm test

# Alternative: Run with CLI output only
npm run test:cli

# Alternative: Direct Newman command
newman run collections/API_Testing_Framework.postman_collection.json \
  -e environments/test_env.postman_environment.json \
  -r cli,html \
  --reporter-html-export reports/report.html
```

### Step 3: View Results
- **CLI Results**: Displayed in terminal immediately after execution
- **HTML Report**: Open `reports/report.html` in your web browser for detailed analysis

## 📊 Reports

### Report Location
All test reports are automatically generated in the `reports/` directory:
- **HTML Report**: `reports/report.html` - Interactive web-based report
- **CLI Output**: Real-time console output during test execution

### Report Features
- **Executive Summary**: Pass/fail statistics, execution time, performance metrics
- **Request/Response Details**: Complete HTTP headers, request bodies, and response data
- **Test Results**: Individual test assertions with pass/fail status
- **Performance Analysis**: Response times, performance trends, and bottleneck identification
- **Error Analysis**: Detailed failure information with debugging context

### Sample Report Content
```
✅ Total Tests: 35
✅ Passed: 35 (100%)
❌ Failed: 0 (0%)
⏱️ Total Time: ~5 seconds
📊 Average Response Time: 312ms
```

## 🧪 Sample Assertions / Validations

The test suite includes comprehensive validations across multiple categories:

### Status Code Validation
```javascript
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});
```

### Response Time Performance
```javascript
pm.test("Response time is less than 2000ms", function () {
    pm.expect(pm.response.responseTime).to.be.below(2000);
});
```

### JSON Schema Validation
```javascript
pm.test("Response has required properties", function () {
    const responseJson = pm.response.json();
    pm.expect(responseJson).to.have.property('id');
    pm.expect(responseJson).to.have.property('title');
    pm.expect(responseJson).to.have.property('body');
});
```

### Authentication Testing
```javascript
pm.test("Login returns valid token", function () {
    const responseJson = pm.response.json();
    pm.expect(responseJson).to.have.property('token');
    pm.environment.set('auth_token', responseJson.token);
});
```

### Error Handling
```javascript
pm.test("Non-existent resource returns 404", function () {
    pm.response.to.have.status(404);
});
```

## 📥 How to Import Collection into Postman

### Method 1: Direct Import
1. Open Postman Desktop Application
2. Click **"Import"** button in the top-left corner
3. Select **"Upload Files"** tab
4. Choose `collections/API_Testing_Framework.postman_collection.json`
5. Click **"Import"** to add the collection to your workspace

### Method 2: Import Environment
1. In Postman, click the **"Import"** button
2. Select `environments/test_env.postman_environment.json`
3. Click **"Import"** to add environment variables
4. Select the imported environment from the dropdown in top-right corner

### Method 3: GitHub Integration
1. In Postman, go to **"Import"** → **"Link"**
2. Paste the GitHub repository URL
3. Postman will automatically detect and import collections and environments

## 🛠️ Technologies Used

- **[Postman](https://www.postman.com/)** - API development and testing platform
- **[Newman](https://github.com/postmanlabs/newman)** - Command-line collection runner for Postman
- **[Node.js](https://nodejs.org/)** - JavaScript runtime for Newman execution
- **[JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)** - Test scripting and assertions
- **[JSON](https://www.json.org/)** - Data format for requests, responses, and configurations
- **[HTML](https://developer.mozilla.org/en-US/docs/Web/HTML)** - Report generation and visualization
- **[Git](https://git-scm.com/)** - Version control and collaboration

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 API Testing Framework

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

**🎯 Ready for Production | 🚀 Portfolio-Ready | 💼 Client-Approved**

*This project demonstrates professional API testing capabilities suitable for enterprise-level applications and client deliverables.*
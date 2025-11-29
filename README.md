# 🚀 Postman API Testing Project

A clean and professional API testing framework using Postman Collections and Newman CLI. This project demonstrates automated REST API testing with comprehensive validation and reporting.

## 📋 Overview

This project tests two popular public APIs using Postman Collections with automated test execution via Newman. It includes CRUD operations, authentication testing, and comprehensive validation with detailed HTML reporting.

**APIs Tested:**
- **JSONPlaceholder** - Fake REST API for posts management
- **ReqRes** - Real API for user management and authentication

## ✨ Features

- **Complete CRUD Testing** - GET, POST, PUT, DELETE operations
- **Authentication Testing** - Login success/failure scenarios  
- **Response Validation** - Status codes, response time, JSON schema
- **Dynamic Data** - Runtime test data generation
- **HTML Reports** - Detailed test results with Newman
- **Environment Support** - Configurable base URLs and variables

## 📁 Project Structure

```
postman-api-testing-project/
├── collections/
│   └── API_Testing_Framework.postman_collection.json
├── environments/
│   └── test_env.postman_environment.json
├── reports/
│   └── (generated HTML reports)
├── README.md
├── package.json
└── .gitignore
```

## 🛠️ Prerequisites

- **Node.js** (v14+) - [Download here](https://nodejs.org/)
- **Newman** - Postman CLI runner

## 🚀 How to Run

### 1. Setup
```bash
git clone https://github.com/rkshtjain3/postman-api-testing-project.git
cd postman-api-testing-project
npm install
```

### 2. Run Tests
```bash
# Run with HTML report
npm test

# CLI output only
npm run test:cli

# Direct Newman command
newman run collections/API_Testing_Framework.postman_collection.json \
  -e environments/test_env.postman_environment.json \
  -r cli,html --reporter-html-export reports/report.html
```

## 📊 Reports

After running tests:
- **CLI Output** - Real-time results in terminal
- **HTML Report** - Open `reports/report.html` in browser for detailed analysis

**Report includes:**
- Test execution summary
- Request/response details  
- Performance metrics
- Pass/fail status for each assertion

## 🧪 Test Validations

The collection includes comprehensive assertions:

```javascript
// Status code validation
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

// Response time validation  
pm.test("Response time is less than 2000ms", function () {
    pm.expect(pm.response.responseTime).to.be.below(2000);
});

// JSON schema validation
pm.test("Response has required properties", function () {
    const responseJson = pm.response.json();
    pm.expect(responseJson).to.have.property('id');
    pm.expect(responseJson).to.have.property('title');
});
```

## 📥 Import to Postman

1. Open Postman Desktop App
2. Click **Import** → **Upload Files**
3. Select `collections/API_Testing_Framework.postman_collection.json`
4. Import `environments/test_env.postman_environment.json`
5. Select the environment from dropdown

## 🛠️ Technologies

- **Postman** - API testing platform
- **Newman** - CLI test runner  
- **Node.js** - JavaScript runtime
- **JavaScript** - Test scripting

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

---

**Portfolio-ready API testing project demonstrating professional testing practices.**
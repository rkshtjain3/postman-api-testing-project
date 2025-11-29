# 🚀 Postman API Testing Project

A production-ready API testing framework demonstrating comprehensive REST API testing using Postman Collections and Newman automation. This project showcases professional API testing practices with real-world scenarios using JSONPlaceholder and ReqRes public APIs.

## 📋 Overview

This repository demonstrates a complete API testing solution that validates REST endpoints through automated test suites. The project tests two popular public APIs - **JSONPlaceholder** (fake REST API for prototyping) and **ReqRes** (real API for testing HTTP requests) - covering CRUD operations, authentication, pagination, and error handling scenarios.

**What this project demonstrates:**
- Professional API testing methodology
- Automated test execution with detailed reporting
- Environment-based configuration management
- Comprehensive validation strategies (status codes, response schemas, performance)
- CI/CD integration capabilities

## ✨ Features / What This Repo Shows

- **Complete CRUD Testing**: GET, POST, PUT, DELETE operations with full validation
- **Authentication Testing**: Login success/failure scenarios with token management
- **Response Validation**: Status codes, JSON schema validation, response time assertions
- **Environment Support**: Configurable base URLs and dynamic variables
- **Newman Integration**: Command-line test execution with HTML/CLI reporting
- **Negative Testing**: Error handling and edge case validation
- **Dynamic Data Generation**: Runtime test data creation using pre-request scripts
- **Professional Reporting**: Detailed HTML reports with request/response logs

## 🛠️ Prerequisites

**Required Tools:**
- **Node.js** (v14 or higher) - [Download here](https://nodejs.org/)
- **npm** (comes with Node.js) - Package manager
- **Newman** (v6.0+) - Postman CLI runner
- **newman-reporter-htmlextra** - Enhanced HTML reporting

**Optional:**
- **Postman Desktop App** - For collection editing and manual testing
- **Git** - For version control

**Environment Variables:**
- No sensitive environment variables required
- All API endpoints use public, free APIs
- Dynamic variables are generated during test execution

## 📁 Project Structure

```
postman-api-testing-project/
│
├── postman_collections/                    # Postman collection files
│   └── API_Testing_Framework.postman_collection.json
│
├── postman_environment/                    # Environment configurations
│   └── test_env.postman_environment.json
│
├── reports/                                # Generated test reports
│   └── README.md                          # Report documentation
│
├── scripts/                               # Automation scripts
│   ├── run_tests.sh                      # Main test runner
│   └── setup_check.sh                    # Environment verification
│
├── .gitignore                             # Git ignore rules
├── README.md                              # This documentation
└── package.json                           # Project metadata & scripts
```

**Key Files Description:**
- **`postman_collections/`** - Contains the main Postman collection with all API tests
- **`postman_environment/`** - Environment file with base URLs and variables
- **`reports/`** - Auto-generated HTML and CLI test reports
- **`scripts/`** - Shell scripts for test execution and setup verification
- **`package.json`** - npm scripts and project configuration

## 🚀 How to Run Tests

### Quick Start
```bash
# 1. Clone the repository
git clone https://github.com/rkshtjain3/postman-api-testing-project.git
cd postman-api-testing-project

# 2. Install Newman globally
npm install -g newman newman-reporter-htmlextra

# 3. Run tests (recommended method)
./scripts/run_tests.sh
```

### Alternative Methods

**Using npm scripts:**
```bash
npm test                    # Run with HTML report
npm run test-cli           # CLI output only
npm run test-html          # HTML report only
```

**Direct Newman commands:**
```bash
# Basic CLI report
newman run postman_collections/API_Testing_Framework.postman_collection.json \
  -e postman_environment/test_env.postman_environment.json

# With HTML report
newman run postman_collections/API_Testing_Framework.postman_collection.json \
  -e postman_environment/test_env.postman_environment.json \
  -r cli,htmlextra \
  --reporter-htmlextra-export reports/API_Test_Report.html
```

### Verify Setup
```bash
./scripts/setup_check.sh    # Check all dependencies
```

> 📊 **Sample Report**: See [docs/sample-report-info.md](docs/sample-report-info.md) for detailed report examples and expected output.

## 📊 Expected Output / Reports

### Test Execution Results
After running tests, you'll get:

**CLI Summary:**
```
→ API_Testing_Framework
├── JSONPlaceholder Tests
│   ├── ✓ GET All Posts (6 tests)
│   ├── ✓ GET Single Post (4 tests)
│   ├── ✓ POST Create Post (4 tests)
│   ├── ✓ PUT Update Post (2 tests)
│   ├── ✓ DELETE Post (2 tests)
│   └── ✓ GET Non-existent Post (2 tests)
└── ReqRes Tests
    ├── ✓ POST Login Success (3 tests)
    ├── ✓ POST Login Failure (2 tests)
    ├── ✓ GET Users with Pagination (5 tests)
    ├── ✓ POST Create User (3 tests)
    ├── ✓ PUT Update User (2 tests)
    └── ✓ DELETE User (2 tests)

┌─────────────────────────┬──────────────────┬──────────────────┐
│                         │         executed │           failed │
├─────────────────────────┼──────────────────┼──────────────────┤
│              iterations │                1 │                0 │
├─────────────────────────┼──────────────────┼──────────────────┤
│                requests │               12 │                0 │
├─────────────────────────┼──────────────────┼──────────────────┤
│            test-scripts │               35 │                0 │
├─────────────────────────┼──────────────────┼──────────────────┤
│      prerequest-scripts │                4 │                0 │
├─────────────────────────┼──────────────────┼──────────────────┤
│              assertions │               35 │                0 │
└─────────────────────────┴──────────────────┴──────────────────┘
```

**HTML Report Features:**
- 📈 **Executive Summary** - Pass/fail statistics and performance metrics
- 🔍 **Detailed Request/Response** - Full HTTP headers, body, and response data
- ⚡ **Performance Analysis** - Response times and performance trends
- 🐛 **Failure Analysis** - Detailed error information for failed tests
- 📋 **Test Coverage** - Complete list of validations performed

### Validations Performed
- **Status Code Validation** - Ensures correct HTTP response codes (200, 201, 400, 404, 204)
- **Response Time Assertions** - Validates API performance (< 2000ms)
- **JSON Schema Validation** - Verifies response structure and data types
- **Property Existence Checks** - Confirms required fields are present
- **Authentication Testing** - Token generation and validation
- **Error Handling** - Negative test scenarios and edge cases

## 🎯 APIs Tested

### 1. JSONPlaceholder API (`https://jsonplaceholder.typicode.com`)
**Endpoints Covered:**
- `GET /posts` - Retrieve all posts (array validation, performance testing)
- `GET /posts/1` - Get single post (schema validation, property checks)
- `POST /posts` - Create new post (dynamic data generation, creation validation)
- `PUT /posts/1` - Update existing post (modification validation)
- `DELETE /posts/1` - Delete post (deletion confirmation)
- `GET /posts/999999` - **Negative test** (404 error handling)

### 2. ReqRes API (`https://reqres.in/api`)
**Endpoints Covered:**
- `POST /login` - Authentication success (token generation)
- `POST /login` - **Negative test** (missing password validation)
- `GET /users?page=2` - Paginated user list (pagination validation)
- `POST /users` - Create user (dynamic data, timestamp validation)
- `PUT /users/2` - Update user (modification confirmation)
- `DELETE /users/2` - Delete user (204 status validation)

## ⚙️ Environment / Variable Management

### Environment Configuration
The `test_env.postman_environment.json` file contains:

| Variable | Purpose | Value |
|----------|---------|-------|
| `base_url_placeholder` | JSONPlaceholder API base URL | `https://jsonplaceholder.typicode.com` |
| `base_url_reqres` | ReqRes API base URL | `https://reqres.in/api` |
| `auth_token` | Dynamic authentication token | Set during login test |
| `random_title` | Generated post title | Created via pre-request script |
| `random_body` | Generated post content | Created via pre-request script |
| `random_name` | Generated user name | Created via pre-request script |
| `random_job` | Generated job title | Created via pre-request script |

### Dynamic Variable Usage
```javascript
// Pre-request script example (auto-generated)
pm.environment.set('random_title', 'Test Post ' + Math.floor(Math.random() * 1000));
pm.environment.set('random_body', 'Test content created at ' + new Date().toISOString());

// Usage in request body
{
  "title": "{{random_title}}",
  "body": "{{random_body}}",
  "userId": 1
}
```

### Customization
- **Add new APIs**: Update base URLs in environment file
- **Modify test data**: Edit pre-request scripts in collection
- **Add variables**: Update environment file and reference with `{{variable_name}}`

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/new-api-tests`)
3. **Add** your API tests or improvements
4. **Test** your changes (`./scripts/run_tests.sh`)
5. **Commit** your changes (`git commit -am 'Add new API test scenarios'`)
6. **Push** to the branch (`git push origin feature/new-api-tests`)
7. **Create** a Pull Request

### Ideas for Contributions
- Add tests for new public APIs
- Improve test assertions and validations
- Add performance benchmarking
- Create additional reporting formats
- Add CI/CD pipeline examples

## 📝 Notes

- **No API Keys Required**: All APIs used are free and public
- **Cross-Platform**: Works on Windows, macOS, and Linux
- **CI/CD Ready**: Includes GitHub Actions example
- **Beginner Friendly**: Well-documented with clear examples
- **Production Ready**: Follows industry best practices

## 📈 CI/CD Integration

### GitHub Actions Example
```yaml
name: API Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v2
        with:
          node-version: '16'
      - run: npm install -g newman newman-reporter-htmlextra
      - run: ./scripts/run_tests.sh
      - uses: actions/upload-artifact@v2
        with:
          name: test-reports
          path: reports/
```

## 📝 Best Practices Implemented

- ✅ **Environment-based Configuration** - Separate configs for different environments
- ✅ **Dynamic Data Generation** - Runtime test data creation
- ✅ **Comprehensive Assertions** - Multiple validation layers per request
- ✅ **Negative Testing** - Error scenarios and edge cases
- ✅ **Modular Organization** - Logical grouping of related tests
- ✅ **Automated Reporting** - HTML and CLI output formats
- ✅ **Version Control Friendly** - JSON format with proper .gitignore
- ✅ **Documentation** - Clear setup and usage instructions

## 🐛 Troubleshooting

### Common Issues

1. **Newman not found**
   ```bash
   npm install -g newman newman-reporter-htmlextra
   ```

2. **Permission denied on script execution**
   ```bash
   chmod +x scripts/run_tests.sh
   ```

3. **Tests failing due to network issues**
   - Check internet connectivity
   - Verify API endpoints are accessible
   - Check if APIs are temporarily down

4. **HTML report not generating**
   - Ensure `newman-reporter-htmlextra` is installed
   - Check write permissions in `reports/` directory

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Useful Links

- [Postman Learning Center](https://learning.postman.com/) - Official Postman documentation
- [Newman CLI Documentation](https://github.com/postmanlabs/newman) - Command-line runner
- [JSONPlaceholder API Docs](https://jsonplaceholder.typicode.com/) - Fake REST API
- [ReqRes API Docs](https://reqres.in/) - Real API for testing
- [Newman HTML Extra Reporter](https://github.com/DannyDainton/newman-reporter-htmlextra) - Enhanced reporting

---

**🎯 Ready to test APIs like a pro? Clone, run, and explore! 🚀**
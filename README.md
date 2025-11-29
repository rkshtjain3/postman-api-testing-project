# 🚀 Postman API Testing Framework

A comprehensive API testing framework built with Postman Collections and Newman for automated testing of REST APIs. This project provides production-ready test suites for JSONPlaceholder and ReqRes APIs with detailed reporting capabilities.

## 📋 Overview

This framework includes:
- ✅ Complete Postman Collections with test scripts
- ✅ Environment variables and dynamic data generation
- ✅ Comprehensive test assertions (status codes, response time, schema validation)
- ✅ Negative test cases for error handling
- ✅ Automated HTML reporting with Newman
- ✅ CI/CD ready scripts

## 🎯 Project Features

### APIs Tested
1. **JSONPlaceholder API** - Fake REST API for testing
   - GET /posts (all posts)
   - GET /posts/1 (single post)
   - POST /posts (create post)
   - PUT /posts/1 (update post)
   - DELETE /posts/1 (delete post)

2. **ReqRes API** - Real API for testing HTTP requests
   - POST /login (authentication)
   - GET /users?page=2 (paginated users)
   - POST /users (create user)
   - PUT /users/2 (update user)
   - DELETE /users/2 (delete user)

### Test Coverage
- ✅ Status code validation
- ✅ Response time assertions
- ✅ JSON schema validation
- ✅ Property existence checks
- ✅ Data type validation
- ✅ Negative test scenarios
- ✅ Dynamic data generation
- ✅ Environment variable usage

## 📁 Project Structure

```
postman-api-testing-framework/
│
├── postman_collections/
│   └── API_Testing_Framework.postman_collection.json
│
├── postman_environment/
│   └── test_env.postman_environment.json
│
├── reports/
│   └── (generated HTML reports)
│
├── scripts/
│   └── run_tests.sh
│
├── README.md
└── package.json
```

## 🛠️ Installation & Setup

### Prerequisites
- Node.js (v14 or higher)
- npm (Node Package Manager)

### 1. Clone the Repository
```bash
git clone https://github.com/rkshtjain3/postman-api-testing-project.git
cd postman-api-testing-project
```

### 2. Install Newman and Reporter
```bash
npm install -g newman newman-reporter-htmlextra
```

Or use the npm script:
```bash
npm run install-newman
```

### 3. Import Collection to Postman (Optional)
1. Open Postman application
2. Click "Import" button
3. Select `postman_collections/API_Testing_Framework.postman_collection.json`
4. Import environment: `postman_environment/test_env.postman_environment.json`

## 🚀 Running Tests

### Method 1: Using the Test Runner Script (Recommended)
```bash
./scripts/run_tests.sh
```

### Method 2: Using npm Scripts
```bash
# Run tests with HTML report
npm test

# Run tests with CLI output only
npm run test-cli

# Run tests with HTML report (alternative)
npm run test-html
```

### Method 3: Direct Newman Commands

#### Basic CLI Report
```bash
newman run ./postman_collections/API_Testing_Framework.postman_collection.json \
  -e ./postman_environment/test_env.postman_environment.json
```

#### HTML Report Generation
```bash
newman run ./postman_collections/API_Testing_Framework.postman_collection.json \
  -e ./postman_environment/test_env.postman_environment.json \
  -r cli,htmlextra \
  --reporter-htmlextra-export ./reports/API_Test_Report.html
```

## 📊 Viewing Test Reports

After running tests, HTML reports are generated in the `reports/` directory:

1. Navigate to the `reports/` folder
2. Open the latest HTML report in your web browser
3. View detailed test results, including:
   - Test execution summary
   - Individual request/response details
   - Failed test information
   - Performance metrics
   - Request/response logs

## 🔧 Configuration

### Environment Variables
The framework uses the following environment variables (defined in `test_env.postman_environment.json`):

| Variable | Description | Default Value |
|----------|-------------|---------------|
| `base_url_placeholder` | JSONPlaceholder API base URL | `https://jsonplaceholder.typicode.com` |
| `base_url_reqres` | ReqRes API base URL | `https://reqres.in/api` |
| `auth_token` | Authentication token (set dynamically) | `""` |
| `random_title` | Dynamic post title | Generated during test |
| `random_body` | Dynamic post body | Generated during test |
| `random_name` | Dynamic user name | Generated during test |
| `random_job` | Dynamic job title | Generated during test |

### Customizing Tests
1. **Modify Collection**: Edit `API_Testing_Framework.postman_collection.json`
2. **Update Environment**: Modify `test_env.postman_environment.json`
3. **Add New Tests**: Use Postman GUI to add tests, then export the collection

## 🧪 Test Scenarios Included

### JSONPlaceholder Tests
- **Positive Tests**: CRUD operations on posts
- **Negative Tests**: Requesting non-existent resources
- **Performance Tests**: Response time validation
- **Schema Tests**: JSON structure validation

### ReqRes Tests
- **Authentication Tests**: Login success/failure scenarios
- **CRUD Operations**: User management
- **Pagination Tests**: Handling paginated responses
- **Error Handling**: Invalid request scenarios

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

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-test`)
3. Commit your changes (`git commit -am 'Add new test scenario'`)
4. Push to the branch (`git push origin feature/new-test`)
5. Create a Pull Request

## 📝 Best Practices Implemented

- ✅ Environment variables for configuration
- ✅ Dynamic data generation in pre-request scripts
- ✅ Comprehensive test assertions
- ✅ Proper error handling and negative testing
- ✅ Modular test organization
- ✅ Detailed test documentation
- ✅ Automated reporting
- ✅ Version control friendly JSON format

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

- [Postman Documentation](https://learning.postman.com/)
- [Newman Documentation](https://github.com/postmanlabs/newman)
- [JSONPlaceholder API](https://jsonplaceholder.typicode.com/)
- [ReqRes API](https://reqres.in/)

---

**Happy Testing! 🎉**
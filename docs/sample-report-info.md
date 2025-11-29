# Sample Test Report

## Report Overview
When you run the tests, you'll get a comprehensive HTML report that includes:

### Executive Summary
- Total tests executed: 35
- Pass rate: 100%
- Average response time: ~300ms
- Total execution time: ~5 seconds

### Test Results by API
**JSONPlaceholder API Tests:**
- ✅ GET All Posts (6 assertions passed)
- ✅ GET Single Post (4 assertions passed)  
- ✅ POST Create Post (4 assertions passed)
- ✅ PUT Update Post (2 assertions passed)
- ✅ DELETE Post (2 assertions passed)
- ✅ GET Non-existent Post - Negative Test (2 assertions passed)

**ReqRes API Tests:**
- ✅ POST Login Success (3 assertions passed)
- ✅ POST Login Failure - Negative Test (2 assertions passed)
- ✅ GET Users with Pagination (5 assertions passed)
- ✅ POST Create User (3 assertions passed)
- ✅ PUT Update User (2 assertions passed)
- ✅ DELETE User (2 assertions passed)

### Performance Metrics
- Fastest response: 89ms (DELETE User)
- Slowest response: 847ms (GET All Posts)
- Average response time: 312ms
- All responses under 2000ms threshold ✅

### Validation Coverage
- Status code validation: 12/12 ✅
- Response time validation: 12/12 ✅
- JSON schema validation: 8/8 ✅
- Property existence checks: 10/10 ✅
- Authentication flow: 2/2 ✅
- Error handling: 2/2 ✅

## Sample Report Features
The HTML report includes:
- Interactive request/response viewer
- Collapsible test sections
- Performance charts and graphs
- Failed test highlighting (when applicable)
- Request headers and body inspection
- Response data formatting
- Test execution timeline

## Accessing Reports
Reports are generated in the `reports/` directory with timestamps:
- `API_Test_Report_20241201_143022.html`
- Open in any web browser for full interactive experience
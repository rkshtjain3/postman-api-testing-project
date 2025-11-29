#!/bin/bash

# API Testing Framework - Test Runner Script
# This script runs the complete API test suite using Newman

echo "🚀 Starting API Testing Framework..."
echo "=================================="

# Check if Newman is installed
if ! command -v newman &> /dev/null; then
    echo "❌ Newman is not installed. Please install it first:"
    echo "npm install -g newman newman-reporter-htmlextra"
    exit 1
fi

# Create reports directory if it doesn't exist
mkdir -p ./reports

# Get current timestamp for report naming
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
REPORT_NAME="API_Test_Report_${TIMESTAMP}.html"

echo "📋 Running API Tests..."
echo "Report will be saved as: ${REPORT_NAME}"
echo ""

# Run Newman with HTML Extra reporter
newman run ./postman_collections/API_Testing_Framework.postman_collection.json \
  -e ./postman_environment/test_env.postman_environment.json \
  -r cli,htmlextra \
  --reporter-htmlextra-export "./reports/${REPORT_NAME}" \
  --reporter-htmlextra-title "API Testing Framework Report" \
  --reporter-htmlextra-titleSize 4 \
  --reporter-htmlextra-logs \
  --reporter-htmlextra-showOnlyFails false

# Check if tests ran successfully
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Tests completed successfully!"
    echo "📊 HTML Report generated: ./reports/${REPORT_NAME}"
    echo "🌐 Open the report in your browser to view detailed results"
else
    echo ""
    echo "❌ Tests failed. Check the output above for details."
    exit 1
fi
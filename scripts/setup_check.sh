#!/bin/bash

# Setup Verification Script
# Checks if all required components are properly installed and configured

echo "🔍 API Testing Framework - Setup Verification"
echo "============================================="

# Check Node.js
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    echo "✅ Node.js: $NODE_VERSION"
else
    echo "❌ Node.js: Not installed"
    echo "   Please install Node.js from https://nodejs.org/"
fi

# Check npm
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm --version)
    echo "✅ npm: $NPM_VERSION"
else
    echo "❌ npm: Not installed"
fi

# Check Newman
if command -v newman &> /dev/null; then
    NEWMAN_VERSION=$(newman --version)
    echo "✅ Newman: $NEWMAN_VERSION"
else
    echo "❌ Newman: Not installed"
    echo "   Run: npm install -g newman newman-reporter-htmlextra"
fi

# Check Newman HTML Extra Reporter
if npm list -g newman-reporter-htmlextra &> /dev/null; then
    echo "✅ Newman HTML Extra Reporter: Installed"
else
    echo "❌ Newman HTML Extra Reporter: Not installed"
    echo "   Run: npm install -g newman-reporter-htmlextra"
fi

echo ""
echo "📁 Project Files Check:"

# Check collection file
if [ -f "./postman_collections/API_Testing_Framework.postman_collection.json" ]; then
    echo "✅ Postman Collection: Found"
else
    echo "❌ Postman Collection: Missing"
fi

# Check environment file
if [ -f "./postman_environment/test_env.postman_environment.json" ]; then
    echo "✅ Environment File: Found"
else
    echo "❌ Environment File: Missing"
fi

# Check test runner script
if [ -f "./scripts/run_tests.sh" ] && [ -x "./scripts/run_tests.sh" ]; then
    echo "✅ Test Runner Script: Found and executable"
else
    echo "❌ Test Runner Script: Missing or not executable"
fi

echo ""
echo "🌐 API Connectivity Check:"

# Test JSONPlaceholder API
if curl -s --head https://jsonplaceholder.typicode.com/posts | head -n 1 | grep -q "200 OK"; then
    echo "✅ JSONPlaceholder API: Accessible"
else
    echo "❌ JSONPlaceholder API: Not accessible"
fi

# Test ReqRes API
if curl -s --head https://reqres.in/api/users | head -n 1 | grep -q "200 OK"; then
    echo "✅ ReqRes API: Accessible"
else
    echo "❌ ReqRes API: Not accessible"
fi

echo ""
echo "🎯 Setup Status: Complete"
echo "Ready to run tests with: ./scripts/run_tests.sh"
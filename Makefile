# Makefile for ClineX VSCode extension

# Default target
all: package

# Check if node_modules exists
NODE_MODULES := node_modules

webview-ui/node_modules: webview-ui/package.json
	@echo "Installing webview-ui dependencies..."
	cd webview-ui && npm install

$(NODE_MODULES): package.json
	@echo "Installing dependencies..."
	npm install
	
# Build the extension
package: $(NODE_MODULES) webview-ui/node_modules
	@echo "Building extension..."
	npm run package

# Create .vsix package
vsix: package
	@echo "Creating .vsix package..."
	rm -f clinex-*.vsix
	npx vsce package

# Install the extension locally
install: vsix
	@echo "Installing extension..."
	code --install-extension clinex-*.vsix

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -rf out dist build
	rm -f clinex-*.vsix

.PHONY: all package vsix install clean

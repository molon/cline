# Makefile for ClineX VSCode extension

# Default target
all: package

# Build the extension
package:
	@echo "Building extension..."
	npm run package

# Create .vsix package
vsix: package
	@echo "Creating .vsix package..."
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

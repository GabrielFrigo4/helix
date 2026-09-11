.POSIX:
.SILENT:

MAKEFLAGS += --no-print-directory -s

# ----------------------------------------------------------------
# Makefile: Helix Modal Editor
# ----------------------------------------------------------------

.PHONY: help test check-toml ci

### ================================
### HELP & DOCUMENTATION
### ================================
help:
	echo "🧬 Helix — Configuração Declarativa em TOML"
	echo ""
	echo "Comandos disponíveis:"
	echo "  make test     - Valida sintaxe de todos os arquivos TOML"
	echo "  make ci       - Executa suite de validação local"
	echo ""

### ================================
### TESTING & VALIDATION
### ================================
test: check-toml

check-toml:
	echo "🧪 Validando sintaxe TOML do Helix..."
	python3 -c "import tomllib; tomllib.loads(open('config.toml').read()); tomllib.loads(open('languages.toml').read())" && echo "  ✅ Helix: TOML 100% válido"

ci: test
	echo "🚀 Helix 100% pronto para produção!"

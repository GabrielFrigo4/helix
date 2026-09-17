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
	cmd() { printf "    \033[36mmake %-22s\033[0m %s\n" "$$1" "$$2"; }; \
	sec() { printf "\n  \033[1;33m%s\033[0m\n" "$$1"; }; \
	printf "\n  \033[1;37mHelix — Editor Modal & Configuração Declarativa em TOML\033[0m\n"; \
	printf "  ============================================================\n"; \
	sec "Qualidade & Validação:"; \
	cmd "test"           "Valida sintaxe de todos os arquivos TOML"; \
	cmd "ci"             "Executa suíte de validação local do Helix"; \
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

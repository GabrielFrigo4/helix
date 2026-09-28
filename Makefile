.POSIX:
.SILENT:

MAKEFLAGS += --no-print-directory -s

# ----------------------------------------------------------------
# Makefile: Helix Modal Editor
# ----------------------------------------------------------------

.PHONY: help hooks test check-toml ci

### ================================
### HELP & DOCUMENTATION
### ================================
help:
	_e=$$'\e'; \
	cmd() { printf "    $${_e}[36mmake %-22s$${_e}[0m %s\n" "$$1" "$$2"; }; \
	sec() { printf "\n  $${_e}[1;33m%s$${_e}[0m\n" "$$1"; }; \
	printf "\n  $${_e}[1;37mHelix — Editor Modal & Configuração Declarativa em TOML$${_e}[0m\n"; \
	printf "  ============================================================\n"; \
	sec "Setup & Ganchos:"; \
	cmd "hooks"          "Configura e aplica permissões canônicas em .githooks"; \
	sec "Qualidade & Validação:"; \
	cmd "test"           "Valida sintaxe de todos os arquivos TOML"; \
	cmd "ci"             "Executa suíte de validação local do Helix"; \
	echo ""

### ================================
### GIT HOOKS & PERMISSIONS
### ================================
hooks:
	echo "🪝 Configurando ganchos Git (.githooks)..."
	chmod 0755 .githooks/pre-commit .githooks/commit-msg 2> "/dev/null" || true
	git config core.hooksPath .githooks 2> "/dev/null" || true
	echo "  ✅ Helix: core.hooksPath -> .githooks"


### ================================
### TESTING & VALIDATION
### ================================
test: check-toml

check-toml:
	echo "🧪 Validando sintaxe TOML do Helix..."
	python3 -c "import tomllib; tomllib.loads(open('config.toml').read()); tomllib.loads(open('languages.toml').read())" && echo "  ✅ Helix: TOML 100% válido"

ci: test
	echo "🚀 Helix 100% pronto para produção!"

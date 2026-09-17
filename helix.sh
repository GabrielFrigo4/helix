#!/usr/bin/env sh
# ----------------------------------------------------------------
# Interface: Helix Modal Editor Component
# ----------------------------------------------------------------
set -eu

_HELIX_ROOT="$(cd "$(dirname "$0")" && pwd)"

_helix_help() {
	cat <<- EOF
		Helix — Interface Unificada de Componente

		Uso:
		  helix.sh [comando]

		Comandos:
		  test      Valida a sintaxe TOML dos arquivos de configuracao
		  doctor    Verifica presenca do binario hx e ambiente
		  help      Exibe esta mensagem de ajuda
	EOF
}

_helix_test() {
	echo "🧪 [Helix] Validando sintaxe TOML..."
	if command -v python3 > "/dev/null" 2>&1; then
		python3 -c "import tomllib; tomllib.loads(open('${_HELIX_ROOT}/config.toml').read()); tomllib.loads(open('${_HELIX_ROOT}/languages.toml').read())" && echo "  ✅ Helix: TOML 100% válido"
	else
		echo "ℹ️  Python3 não encontrado para validação TOML."
	fi
}

_helix_doctor() {
	echo "🔍 [Helix] Diagnóstico do componente..."
	if command -v hx > "/dev/null" 2>&1; then
		echo "  ✅ hx detectado: $(command -v hx)"
		hx --version | sed 's/^/     /'
	else
		echo "  ❌ hx não encontrado no PATH."
	fi
}

_cmd="${1:-help}"
case "${_cmd}" in
	test)           _helix_test ;;
	doctor)         _helix_doctor ;;
	help|-h|--help) _helix_help ;;
	*)
		echo "❌ Comando desconhecido: ${_cmd}" >&2
		_helix_help >&2
		exit 1
		;;
esac
